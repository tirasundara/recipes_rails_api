require 'swagger_helper'

RSpec.describe 'api/reviews', type: :request do
  let!(:recipe) { create(:recipe) }

  # jitera-hook-for-rswag-example

  path "/api/recipes/{recipe_id}/reviews" do
    post 'Create reviews' do
      tags 'create'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'recipe_id', in: :path, type: 'string', description: 'recipe_id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          review: {
            type: :object,
            properties: {
              rating: {
                type: :integer,
                example: 5,
                description: 'valid value: integer 1 to 5'
              },
              description: {
                type: :text,
                example: 'nice recipe!'
              }
            }
          }
        }
      }

      response '201', 'create' do
        examples 'application/json' => {}
        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:recipe_id) { recipe.id }
        let(:params) do
          {
            review: {
              rating: 5,
              description: 'nice recipe!'
            }
          }
        end

        run_test! do |response|
          expect(response.status).to eq(201)
        end
      end

      response '422', 'create' do
        examples 'application/json' => {
          recipe: ['must exist'],
          rating: ['must be an integer']
        }
        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:recipe_id) { recipe.id }
        let(:params) do
          {
            review: {
              rating: 2.5,
              description: 'nice recipe!'
            }
          }
        end
        run_test! do |response|
          expect(response.status).to eq(422)
        end
      end
    end
  end
end
