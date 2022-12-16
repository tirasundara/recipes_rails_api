# frozen_string_literal: true

module Weights
  class Gram < BaseWeight
    attr_accessor :value
    attr_reader :unit_name

    def initialize(value)
      super
      @unit_name = :g
    end
  end
end
