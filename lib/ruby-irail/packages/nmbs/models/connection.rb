require "roxml"
require_relative "./departure.rb"

module IRail::NMBS
  class Connection
    include ROXML

    xml_accessor :id,        :from => "@id"
    xml_accessor :departure, :as   => Departure
  end
end