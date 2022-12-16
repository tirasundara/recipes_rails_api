# frozen_string_literal: true

module Weights
  class BaseWeight
    def initialize(value)
      @value = value
      @unit_name = nil  # subclass must assign its unit name
    end

    def value
      raise NotImplementedError, "implement ##{__method__} in subclass!"
    end

    def value=(new_value)
      raise NotImplementedError, "implement ##{__method__} in subclass!"
    end

    def unit_name
      raise NotImplementedError, "implement ##{__method__} in subclass!"
    end
  end
end
