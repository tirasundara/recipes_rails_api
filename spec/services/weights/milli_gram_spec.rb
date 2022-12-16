# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Weights::MilliGram do
  let(:milli_gram) { described_class.new(1) }

  describe '#value' do
    it 'returns the value' do
      expect(milli_gram.value).to eq(1)
    end
  end

  describe '#value=' do
    it 'sets new value' do
      milli_gram.value = 99
      expect(milli_gram.value).to eq(99)
    end
  end

  describe '#unit_name' do
    it 'returns the unit_name' do
      expect(milli_gram.unit_name).to eq(:mg)
    end
  end
end
