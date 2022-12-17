FactoryBot.define do
  factory :review do
    user
    recipe

    rating { 5 }
    description { 'nice recipe!' }
  end
end
