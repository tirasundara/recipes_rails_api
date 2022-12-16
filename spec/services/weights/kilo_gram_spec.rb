# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Weights::KiloGram do
  let(:kilo_gram) { described_class.new(1) }

  describe '#value' do
    it 'returns the value' do
      expect(kilo_gram.value).to eq(1)
    end
  end

  describe '#value=' do
    it 'sets new value' do
      kilo_gram.value = 99
      expect(kilo_gram.value).to eq(99)
    end
  end

  describe '#unit_name' do
    it 'returns the unit_name' do
      expect(kilo_gram.unit_name).to eq(:kg)
    end
  end
end
