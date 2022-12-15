require 'swagger_helper'

RSpec.describe 'api/recipes', type: :request do
  before do
    create(:recipe, time: '00:15:00')
  end

  # jitera-hook-for-rswag-example

  path '/api/recipes/{id}' do
    delete 'Destroy recipes' do
      tags 'delete'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:recipe).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes/{id}' do
    put 'Update recipes' do
      tags 'update'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_object' => {}

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:id) { create(:recipe).id }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes/{id}' do
    get 'Show recipes' do
      tags 'show'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:recipe).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes' do
    post 'Create recipes' do
      tags 'create'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes' do
    get 'List recipes' do
      tags 'index'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'title', in: :query, type: 'string', description: 'recipe title', required: false
      parameter name: 'difficulty', in: :query, type: 'string', description: "recipe's difficulty. Valid values: 'easy', 'normal', 'challenging'", required: false
      parameter name: 'min_time', in: :query, type: 'integer', description: 'minimum duration in seconds', required: false
      parameter name: 'max_time', in: :query, type: 'integer', description: 'maximum duration in seconds', required: false

      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'recipes' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'HH:MM:SS',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          }
        ],

            'user_id' => 'foreign_key'

          }
        ],

          'error_message' => 'string'

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
