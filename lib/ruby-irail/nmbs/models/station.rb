require "virtus"

module IRail::NMBS
  class Station
    include Virtus

    attribute :id, String
    attribute :latitude, Float
    attribute :longitude, Float
    attribute :standard_name, String
    attribute :name, String
  end
end