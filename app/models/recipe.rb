class Recipe < ApplicationRecord
  include ConstantValidatable

  # jitera-anchor-dont-touch: relations

  has_many :ingredients, dependent: :destroy

  belongs_to :category

  belongs_to :user

  # jitera-anchor-dont-touch: enum
  enum difficulty: { easy: 0, normal: 1, challenging: 2 }, _suffix: true

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  validates :title, length: { maximum: 255, minimum: 0, message: I18n.t('.out_of_range_error') }, presence: true

  validates :descriptions, length: { maximum: 65_535, minimum: 0, message: I18n.t('.out_of_range_error') },
                           presence: true

  # My opinion:
  # Personally, I prefer to store the time (duration) in an integer datatype representing duration in seconds in the database
  # So, we can have:
  # * Easier to perform comparation-query like BETWEEN, less than or greater than, etc
  # * And also, it will be faster to perform the search. Since, we don't need to convert string 'HH:MM:SS' to seconds in the db level to query recipes by time range

  validates :time, length: { maximum: 8, minimum: 8, message: I18n.t('.out_of_range_error') },
                   format: { with: DURATION_VALIDATION_FORMAT, message: I18n.t('.invalid_duration_format')},
                   presence: true

  validates :difficulty, presence: true

  accepts_nested_attributes_for :ingredients

  def self.associations
    [:ingredients]
  end

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
