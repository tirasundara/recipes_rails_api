require 'swagger_helper'

RSpec.describe 'api/ingredients', type: :request do
  let!(:ingredient) { create(:ingredient) }

  # jitera-hook-for-rswag-example

  path '/api/ingredients/{id}' do
    delete 'Destroy ingredients' do
      tags 'delete'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'ingredients' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }
        let(:params) {}
        let(:id) { create(:ingredient).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ingredients/{id}' do
    put 'Update ingredients' do
      tags 'update'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ingredients: {
            type: :object,
            properties: {
              unit: {
                type: :float,
                example: 'float'
              },

              amount: {
                type: :float,
                example: 'float'
              },

              recipe_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }

      response '200', 'update' do
        examples 'application/json' => {
          'ingredient' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:id) { ingredient.id }
        let(:params) do
          {
            ingredient: ingredient.attributes
          }
        end

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ingredients/{id}' do
    get 'Show ingredients' do
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
          'ingredients' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }
        let(:params) {}
        let(:id) { create(:ingredient).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ingredients' do
    post 'Create ingredients' do
      tags 'create'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ingredient: {
            type: :object,
            properties: {
              unit: {
                type: :float,
                example: 'float'
              },

              amount: {
                type: :float,
                example: 'float'
              },

              recipe_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'ingredient' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:params) do
          {
            ingredient: build(:ingredient).attributes
          }
        end

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/ingredients' do
    get 'List ingredients' do
      tags 'index'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          ingredients: {
            type: :object,
            properties: {
              unit: {
                type: :float,
                example: 'float'
              },

              amount: {
                type: :float,
                example: 'float'
              },

              recipe_id: {
                type: :foreign_key,
                example: 'foreign_key'
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

          'ingredients' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'unit' => 'float',

            'unit' => 'enum_type',

            'amount' => 'float',

            'recipe_id' => 'foreign_key'

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
