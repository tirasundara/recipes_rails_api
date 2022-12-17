class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :description

  belongs_to :user
  belongs_to :recipe
end
