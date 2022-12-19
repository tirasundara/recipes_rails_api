# frozen_string_literal: true

#  WeightConversion
#    this class converts weight from one unit to another
#    for example from kg to g, g to mg, etc
#
#  Example:
#    two_kg = ::Weight::KilloGram.new(2)
#    conversion = ::WeightConversion.new(two_kg)  # here, two_kg acts as a base weight
#
#  HOW TO DO CONVERSION:
#    * Using static/class method:
#      WeightConversion.convert(two_kg, :g)  # => 2000.0
#
#    * Using instance methods
#      conversion.value_in(:g)  # => 2000.0
#
#      Also, we can change the base weight:
#      converstion.base = ::Weight::MilliGram.new(6000)
class WeightConversion
  UNIT_RATIO = {
    mg: 0.001,
    g: 1.0, # Gram is the base ratio
    kg: 1_000.0
    # add other units' ratio here when implementing new Weight class
    # ...
  }.freeze

  attr_reader :base

  def initialize(base)
    @base = base
  end

  class << self
    def convert(weight, other_unit)
      new(weight).value_in(other_unit)
    end
  end

  def value_in(other_unit)
    raise ArgumentError, "invalid other unit: #{other_unit}" unless UNIT_RATIO.key? other_unit

    other_unit_ratio = UNIT_RATIO[other_unit]
    base_value_in_gram / other_unit_ratio
  end

  private

  def base_value_in_gram
    base.value * ratio_to_gram
  end

  def ratio_to_gram
    UNIT_RATIO.fetch(base.unit)
  end
end
