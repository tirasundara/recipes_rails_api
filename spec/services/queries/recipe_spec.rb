require 'rails_helper'

RSpec.describe ::Queries::Recipe do
  let(:recipe_query_svc) { described_class.new }

  describe '#call' do
    before do
      create(:recipe, title: "chicken nugget", time: "00:05:00", difficulty: "normal")
      create(:recipe, title: "chicken katsu", time: "00:15:00", difficulty: "normal")

      create_list(:recipe, 2, time: "00:20:00")
    end

    context "when filtered by title" do
      it "returns matched recipes" do
        recipes = recipe_query_svc.call({ title: "chicken" })

        expect(recipes.size).to eq(2)
      end

    end

    context "when filtered by time range" do
      it "returns matched recipes" do
        recipes = recipe_query_svc.call({ min_time:  60, max_time: 900})

        expect(recipes.size).to eq(2)
      end
    end

    context "when filtered by difficulty" do
      context "with valid value" do
        it "returns matched recipes" do
          recipes = recipe_query_svc.call({ difficulty: "normal" })
  
          expect(recipes.size).to eq(2)
        end
      end

      context "with invalid value" do
        it "returns empty data" do
          recipes = recipe_query_svc.call({ difficulty: "super-hard" })
  
          expect(recipes.size).to be_zero
        end
      end
    end

    context "when there is no filter" do
      it "returns all recipes" do
        recipes = recipe_query_svc.call({})
  
        expect(recipes.size).to eq(4)
      end
    end
  end
end
