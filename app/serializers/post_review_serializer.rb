class PostReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :recipe_id, :rating, :description
end
