# frozen_string_literal: true

# Weights::Convertable - Once included, this module will make "Weight" class convertible
#
# In this case, any class that inherited from ::Weights::BaseWeight will become "convertible"
# Means, it has the abilities to do conversion from one weight (their self weight) to another
module Weights
  module Convertable
    # Let's try to make methods like: #to_s, #to_i -- so we'd have #to_mg, #to_g, #to_kg

    # Actually, we can write meta-programming code to define those methods:
    #
    # { mg: MilliGram, g: Gram, kg: KiloGram }.each do |unit_, weight_class|
    #   define_method "to_#{unit_}" do
    #     value = weight_conversion.value_in(unit_)
    #     weight_class.new(value)
    #   end
    # end

    # But, in order to make things clearer, let's define them one by one for now
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
