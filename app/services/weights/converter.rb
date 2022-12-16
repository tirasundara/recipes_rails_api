# frozen_string_literal: true

module Weights
  class Converter
    # Gram is the base ratio
    WEIGHT_UNIT_RATIO = {
      mg: 0.001,
      g: 1.0,
      kg: 1_000.0
    }.freeze

    attr_accessor :origin_weight

    def initialize(origin_weight)
      @origin_weight = origin_weight
    end

    def call(other_unit)
      raise ArgumentError, "invalid destination weight unit: #{other_unit}" unless WEIGHT_UNIT_RATIO.key? other_unit

      other_unit_ratio = WEIGHT_UNIT_RATIO[other_unit]
      weight_in_gram / other_unit_ratio
    end

    class << self
      def call(origin_weight, new_unit:)
        new(origin_weight).call(new_unit)
      end
    end

    private

    def weight_in_gram
      origin_weight.value * ratio_to_gram
    end

    def ratio_to_gram
      WEIGHT_UNIT_RATIO.fetch(origin_weight.unit_name.to_sym)
    end
  end
end
