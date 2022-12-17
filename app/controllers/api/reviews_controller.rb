# frozen_string_literal: true

module Api
  class ReviewsController < Api::BaseController

    # jitera-anchor-dont-touch: before_action_filter
    before_action :doorkeeper_authorize!, only: [:create, :update, :destroy]
    before_action :current_user_authenticate, only: [:create, :update, :destroy]

    def create
      # I assume, each user will only be able to give one review to the same recipe_id
      # but of course, that review is updatable
      new_review = current_user.reviews.find_or_initialize_by(recipe_id: params[:recipe_id])
      new_review.rating = review_params[:rating]
      new_review.description = review_params[:description]
      new_review.save!

      render json: new_review, serializer: PostReviewSerializer, status: :created
    end

    def show
      render json: review
    end

    def update
      # for security reason, make sure that `current_user` will only be able to update his own review(s)
      # current_user.reviews.update!(params[:id], review_params)
      rev = current_user.reviews.find(params[:id])
      rev.update!(review_params)

      render json: review, scope: current_user
    end

    def destroy
      # for security reason, make sure that `current_user` will only be able to delete his own review(s)
      current_user.reviews.destroy(params[:id])

      render json: {}, status: :no_content
    end


    private

    def review_params
      params.require(:review).permit(:rating, :description)
    end

    def review
      @review ||= Review.includes(:user, :recipe).find_by!(recipe_id: params[:recipe_id], id: params[:id])
    end
  end
end
