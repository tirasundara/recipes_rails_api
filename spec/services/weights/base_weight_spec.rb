# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Weights::BaseWeight do
  let(:base_weight) { described_class.new(1) }

  describe '#value' do
    it 'raises NotImplementedError' do
      expect do
        base_weight.value
      end.to raise_error(NotImplementedError)
    end
  end

  describe '#value=' do
    it 'raises NotImplementedError' do
      expect do
        base_weight.value = 99
      end.to raise_error(NotImplementedError)
    end
  end

  describe '#unit' do
    it 'raises NotImplementedError' do
      expect do
        base_weight.unit
      end.to raise_error(NotImplementedError)
    end
  end
end
