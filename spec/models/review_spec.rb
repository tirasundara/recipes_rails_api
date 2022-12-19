require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { build(:review) }

  describe '#user_id' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#recipe_id' do
    it { is_expected.to belong_to(:recipe) }
  end

  describe '#rating' do
    context 'with non-integer value' do
      it 'is not valid' do
        review.rating = 2.5

        expect(review).not_to be_valid
      end
    end

    context 'with out of range value' do
      it 'is not valid' do
        review.rating = 6

        expect(review).not_to be_valid
      end
    end

    context 'with valid value' do
      it 'is valid' do
        review.rating = 5

        expect(review).to be_valid
      end
    end
  end

  describe '#description' do
    it 'can be nil' do
      review.description = nil

      expect(review).to be_valid
    end
  end
end
