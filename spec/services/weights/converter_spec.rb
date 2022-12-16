# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Weights::Converter do
  let(:kg) { ::Weights::KiloGram.new(2) }
  let(:doubled_instance) { instance_double(described_class) }

  describe '.call' do
    before do
      allow(described_class).to receive(:new).with(kg).and_return(doubled_instance)
    end

    it 'calls #call method' do
      allow(doubled_instance).to receive(:call).with(:g).and_return(2_000)
      value = described_class.call(kg, new_unit: :g)

      expect(value).to eq(2_000)
    end
  end

  describe '#call' do
    let(:converter) { described_class.new(kg) }

    context 'with invalid unit' do
      it 'raises an ArgumentError' do
        expect { converter.call(:invalid_unit) }.to raise_error(ArgumentError)
      end
    end

    context 'with integer value' do
      it 'returns correct converted value' do
        value = converter.call(:g)

        expect(value).to eq(2_000)
      end
    end

    context 'with floating-point value' do
      it 'returns correct converted value' do
        kg.value = 2.5
        value = converter.call(:g)

        expect(value).to eq(2_500)
      end
    end
  end
end
