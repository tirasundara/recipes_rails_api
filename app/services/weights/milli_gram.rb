# frozen_string_literal: true

module Weights
  class MilliGram < BaseWeight
    attr_accessor :value
    attr_reader :unit

    def initialize(value)
      super
      @unit = :mg
    end
  end
end
