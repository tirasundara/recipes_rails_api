require 'swagger_helper'

RSpec.describe 'api/categories', type: :request do
  let!(:category) { create(:category) }

  # jitera-hook-for-rswag-example

  path '/api/categories/{id}' do
    delete 'Destroy categories' do
      tags 'delete'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'integer', description: 'id'

      response '200', 'delete' do
        examples 'application/json' => {
          'category' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'recipes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'title' => 'string',

      'descriptions' => 'text',

      'time' => 'string',

      'difficulty' => 'enum_type',

      'category_id' => 'foreign_key',

      'user_id' => 'foreign_key',

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
  ]

    }
  ],

            'description' => 'text',

            'category_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }
        let(:id) { create(:category).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/categories/{id}' do
    put 'Update categories' do
      tags 'update'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'integer', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          category: {
            type: :object,
            properties: {
              description: {
                type: :text,
                example: 'text'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'category' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'recipes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'title' => 'string',

      'descriptions' => 'text',

      'time' => 'string',

      'difficulty' => 'enum_type',

      'category_id' => 'foreign_key',

      'user_id' => 'foreign_key',

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
  ]

    }
  ],

            'description' => 'text',

            'category_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:id) { create(:category).id }
        let(:params) do
          {
            category: category.attributes
          }
        end

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/categories/{id}' do
    get 'Show categories' do
      tags 'show'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'categories' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'recipes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'title' => 'string',

      'descriptions' => 'text',

      'time' => 'string',

      'difficulty' => 'enum_type',

      'category_id' => 'foreign_key',

      'user_id' => 'foreign_key',

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
  ]

    }
  ],

            'description' => 'text',

            'category_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }
        let(:params) {}
        let(:id) { create(:category).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/categories' do
    post 'Create categories' do
      tags 'create'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          category: {
            type: :object,
            properties: {
              description: {
                type: :text,
                example: 'text'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'category' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'recipes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'title' => 'string',

      'descriptions' => 'text',

      'time' => 'string',

      'difficulty' => 'enum_type',

      'category_id' => 'foreign_key',

      'user_id' => 'foreign_key',

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
  ]

    }
  ],

            'description' => 'text',

            'category_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:params) do
          {
            category: build(:category).attributes
          }
        end

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/categories' do
    get 'List categories' do
      tags 'index'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          categories: {
            type: :object,
            properties: {
              description: {
                type: :text,
                example: 'text'
              }

            }
          },
          pagination_page: {
            type: :pagination_page,
            example: 'pagination_page'
          },
          pagination_limit: {
            type: :pagination_limit,
            example: 'pagination_limit'
          }
        }
      }
      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'categories' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'recipes' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'user_id' => 'foreign_key',

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
        ]

          }
        ],

            'description' => 'text',

            'category_id' => 'foreign_key'

          }
        ],

          'error_message' => 'string'

        }
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
