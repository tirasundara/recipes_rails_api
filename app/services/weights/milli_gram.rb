# frozen_string_literal: true

module Weights
  class MilliGram < BaseWeight
    attr_accessor :value
    attr_reader :unit_name

    def initialize(value)
      super
      @unit_name = :mg
    end
  end
end
