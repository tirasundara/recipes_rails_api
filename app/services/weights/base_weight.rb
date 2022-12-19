# frozen_string_literal: true

module Weights
  class BaseWeight
    include Convertable

    def initialize(value)
      @value = value
      @unit = nil  # subclass must assign its unit name
    end

    def value
      raise NotImplementedError, "implement ##{__method__} in subclass!"
    end

    def value=(new_value)
      raise NotImplementedError, "implement ##{__method__} in subclass!"
    end

    def unit
      raise NotImplementedError, "implement ##{__method__} in subclass!"
    end
  end
end
