# frozen_string_literal: true

module Weights
  class KiloGram < BaseWeight
    attr_accessor :value
    attr_reader :unit_name

    def initialize(value)
      super
      @unit_name = :kg
    end
  end
end
