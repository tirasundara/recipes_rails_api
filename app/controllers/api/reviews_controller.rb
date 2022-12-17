# frozen_string_literal: true

module Api
  class ReviewsController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter
    before_action :doorkeeper_authorize!, only: :create
    before_action :current_user_authenticate, only: :create

    def create
      # I assume, one user will only be able to give one review to the same recipe_id
      # but user will be able to update its review
      review = current_user.reviews.find_or_initialize_by(recipe_id: params[:recipe_id])
      review.rating = review_params[:rating]
      review.description = review_params[:description]

      if review.save

        render json: {}, status: :created
      else

        render json: review.errors.messages, status: :unprocessable_entity
      end
    end

    private

    def review_params
      params.require(:review).permit(:recipe_id, :rating, :description)
    end
  end
end
