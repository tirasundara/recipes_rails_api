class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :description

  belongs_to :recipe
  belongs_to :user do
    scope ? scope : object.user
  end

end