# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::WeightConversion do
  let(:kg) { ::Weights::KiloGram.new(2) }
  let(:doubled_instance) { instance_double(described_class) }

  describe '.convert(weight, other_unit)' do
    before do
      allow(described_class).to receive(:new).with(kg).and_return(doubled_instance)
    end

    it 'calls #value_in method' do
      allow(doubled_instance).to receive(:value_in).with(:g).and_return(2_000)
      value = described_class.convert(kg, :g)

      expect(value).to eq(2_000)
    end
  end

  describe '#value_in(other_unit)' do
    let(:conversion) { described_class.new(kg) }

    context 'with invalid unit' do
      it 'raises an ArgumentError' do
        expect { conversion.value_in(:invalid_unit) }.to raise_error(ArgumentError)
      end
    end

    context 'with integer value' do
      it 'returns correct converted value' do
        value = conversion.value_in(:g)

        expect(value).to eq(2_000)
      end
    end

    context 'with floating-point value' do
      it 'returns correct converted value' do
        kg.value = 2.5
        value = conversion.value_in(:g)

        expect(value).to eq(2_500)
      end
    end
  end
end
