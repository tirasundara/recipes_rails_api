# frozen_string_literal: true

module Weights
  class KiloGram < BaseWeight
    attr_accessor :value
    attr_reader :unit

    def initialize(value)
      super
      @unit = :kg
    end
  end
end
