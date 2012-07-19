require "virtus"

module IRail::MIVBSTIB
  module Attributes
    class Coordinate < Virtus::Attribute::Object
      primitive Float

      def coerce(value)
        value.strip.to_f
      end
    end
  end

  class Station
    include Virtus

    attribute :id,        Integer
    attribute :latitude,  Attributes::Coordinate
    attribute :longitude, Attributes::Coordinate
    attribute :name,      String
  end
end