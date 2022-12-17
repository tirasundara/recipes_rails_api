# frozen_string_literal: true

# Weights::Convertable - Once included, this module will make "Weight" class convertible
#
# In this case, any class that inherited from ::Weights::BaseWeight will become "convertible"
# Means, it has the abilities to do conversion from one weight (their self weight) to another
module Weights
  module Convertable
    # try to make it like: #to_s, #to_i
    # actually, we can implement meta-programming to define these methods
    # but, to make it clear, I define them one by one here
    def to_g
      g_value = weight_conversion.value_in(:g)

      Gram.new(g_value)
    end

    def to_mg
      mg_value = weight_conversion.value_in(:mg)

      MilliGram.new(mg_value)
    end

    def to_kg
      kg_value = weight_conversion.value_in(:kg)

      KiloGram.new(kg_value)
    end

    private

    def weight_conversion
      @weight_conversion ||= ::WeightConversion.new(self)
    end
  end
end
