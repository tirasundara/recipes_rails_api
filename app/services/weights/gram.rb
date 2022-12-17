# frozen_string_literal: true

module Weights
  class Gram < BaseWeight
    attr_accessor :value
    attr_reader :unit

    def initialize(value)
      super
      @unit = :g
    end
  end
end
