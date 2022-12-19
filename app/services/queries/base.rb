# frozen_string_literal: true

module Queries
  class Base
    def initialize(scope)
      @scope = scope
    end

    def call(filters, **options)
      raise NotImplementedError, "implement ##{__method__} in the subclass!"
    end
  end
end
