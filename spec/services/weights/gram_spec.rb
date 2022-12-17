# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Weights::Gram do
  let(:gram) { described_class.new(1) }

  describe '#value' do
    it 'returns the value' do
      expect(gram.value).to eq(1)
    end
  end

  describe '#value=' do
    it 'sets new value' do
      gram.value = 99
      expect(gram.value).to eq(99)
    end
  end

  describe '#unit' do
    it 'returns the unit' do
      expect(gram.unit).to eq(:g)
    end
  end
end
