# frozen_string_literal: true

# FakeGram includes ::Weights::Convertable
class FakeGram
  include ::Weights::Convertable

  attr_reader :unit
  attr_accessor :value

  def initialize(value)
    @value = value
    @unit = :g
  end
end

RSpec.describe FakeGram do  # rubocop:disable RSpec/FilePath
  let(:fake_gram) { described_class.new(1000) }

  describe '#to_mg' do
    it 'returns an instance of Weights::MilliGram' do
      milli_gram = fake_gram.to_mg

      expect(milli_gram).to be_an_instance_of(::Weights::MilliGram)
    end

    it 'has the correct value' do
      milli_gram = fake_gram.to_mg

      expect(milli_gram.value).to eq(1_000_000)
    end
  end

  describe '#to_g' do
    it 'returns an instance of Weights::Gram with correct value' do
      gram = fake_gram.to_g

      expect(gram).to be_an_instance_of(::Weights::Gram)
    end

    it 'has the correct value' do
      gram = fake_gram.to_g

      expect(gram.value).to eq(1000)
    end
  end

  describe '#to_kg' do
    it 'returns an instance of Weights::KiloGram' do
      kg = fake_gram.to_kg

      expect(kg).to be_an_instance_of(::Weights::KiloGram)
    end

    it 'has the correct value' do
      kg = fake_gram.to_kg

      expect(kg.value).to eq(1)
    end
  end
end
