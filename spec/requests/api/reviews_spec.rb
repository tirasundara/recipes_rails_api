require 'swagger_helper'

RSpec.describe 'api/reviews', type: :request do
  let!(:recipe) { create(:recipe) }
  let(:resource_owner) { create(:user) }
  let(:token) { create(:access_token, resource_owner: resource_owner).token }
  let(:Authorization) { "Bearer #{token}" }

  # jitera-hook-for-rswag-example

  path '/api/recipes/{recipe_id}/reviews' do
    post 'Create reviews' do
      tags 'create'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'recipe_id', in: :path, type: :integer, description: 'The id of the recipe that being reviewed'
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
        examples 'application/json' => {
          id: 3,
          user_id: 1,
          recipe_id: 1,
          rating: 5,
          description: 'nice recipe!'
        }
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
          message: [
            'Rating must be an integer'
          ]
        }
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

  path '/api/recipes/{recipe_id}/reviews/{id}' do
    get 'Show review' do
      tags 'show'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'recipe_id', in: :path, type: :integer, description: 'The id of the recipe that being reviewed'
      parameter name: 'id', in: :path, type: :integer, description: 'The id of the review'

      response '200', 'show' do
        examples 'application/json' => {
          id: 3,
          rating: 5,
          description: 'nice recipe!',
          recipe: {
            id: 10,
            created_at: '2022-08-26T07:19:55.302+07:00',
            updated_at: '2022-08-26T07:19:55.302+07:00',
            title: 'Chicken Nugget',
            time: '00:20:00',
            difficulty: 'easy',
            category_id: 10,
            user_id: 1
          },
          user: {
            id: 1,
            email: 'desmond@uniqexample.org',
            created_at: '2022-08-26T07:19:55.289+07:00',
            updated_at: '2022-08-26T07:19:55.289+07:00',
            reset_password_token: nil,
            reset_password_sent_at: nil,
            remember_created_at: nil,
            current_sign_in_at: nil,
            last_sign_in_at: nil,
            current_sign_in_ip: nil,
            last_sign_in_ip: nil,
            sign_in_count: 0
          }
        }
        let(:recipe_id) { recipe.id }
        let(:id) { create(:review, user: resource_owner, recipe: recipe).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end

      response '404', 'show' do
        examples 'application/json' => {
          message: 'Resource not found'
        }
        let(:recipe_id) { recipe.id }
        let(:id) { 0 }

        run_test! do |response|
          expect(response.status).to eq(404)
        end
      end
    end
  end

  path '/api/recipes/{recipe_id}/reviews/{id}' do
    put 'Update review' do
      tags 'update'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'recipe_id', in: :path, type: :integer, description: 'The id of the recipe that being reviewed'
      parameter name: 'id', in: :path, type: :integer, description: 'The id of the review'
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

      response '200', 'update' do
        examples 'application/json' => {
          id: 3,
          rating: 5,
          description: 'nice recipe!',
          recipe: {
            id: 10,
            created_at: '2022-08-26T07:19:55.302+07:00',
            updated_at: '2022-08-26T07:19:55.302+07:00',
            title: 'Chicken Nugget',
            time: '00:20:00',
            difficulty: 'easy',
            category_id: 10,
            user_id: 1
          },
          user: {
            id: 1,
            email: 'desmond@uniqexample.org',
            created_at: '2022-08-26T07:19:55.289+07:00',
            updated_at: '2022-08-26T07:19:55.289+07:00',
            reset_password_token: nil,
            reset_password_sent_at: nil,
            remember_created_at: nil,
            current_sign_in_at: nil,
            last_sign_in_at: nil,
            current_sign_in_ip: nil,
            last_sign_in_ip: nil,
            sign_in_count: 0
          }
        }
        let(:recipe_id) { recipe.id }
        let(:id) { create(:review, user: resource_owner, recipe: recipe).id }
        let(:params) do
          {
            review: {
              rating: 5,
              description: 'nice recipe!'
            }
          }
        end

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end

      response '404', 'update' do
        examples 'application/json' => {
          message: 'Resource not found'
        }
        let(:recipe_id) { recipe.id }
        let(:id) { 0 }
        let(:params) do
          {
            review: {
              rating: 5,
              description: 'nice recipe!'
            }
          }
        end

        run_test! do |response|
          expect(response.status).to eq(404)
        end
      end

      response '422', 'create' do
        examples 'application/json' => {
          message: [
            'Rating must be in 1..5'
          ]
        }
        let(:recipe_id) { recipe.id }
        let(:id) { create(:review, user: resource_owner, recipe: recipe).id }
        let(:params) do
          {
            review: {
              rating: 7.5,
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

  path '/api/recipes/{recipe_id}/reviews/{id}' do
    delete 'Delete review' do
      tags 'delete'
      consumes 'application/json'
      security [bearerAuth: []]
      parameter name: 'recipe_id', in: :path, type: :integer, description: 'The id of the recipe that being reviewed'
      parameter name: 'id', in: :path, type: :integer, description: 'The id of the review'

      response '204', 'destroy' do
        examples 'application/json' => {}
        let(:recipe_id) { recipe.id }
        let(:id) { create(:review, user: resource_owner, recipe: recipe).id }

        run_test! do |response|
          expect(response.status).to eq(204)
        end
      end

      response '404', 'destroy' do
        examples 'application/json' => {
          message: 'Resource not found'
        }
        let(:recipe_id) { recipe.id }
        let(:id) { 0 }

        run_test! do |response|
          expect(response.status).to eq(404)
        end
      end
    end
  end
end
