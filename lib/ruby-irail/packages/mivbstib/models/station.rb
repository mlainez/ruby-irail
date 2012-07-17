require "virtus"

module IRail::MIVBSTIB
  class Station
    include Virtus

    attribute :id, Integer
    attribute :latitude, Float
    attribute :longitude, Float
    attribute :name, String
  end
end