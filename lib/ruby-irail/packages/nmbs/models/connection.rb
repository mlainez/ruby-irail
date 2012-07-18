require "roxml"
require_relative "./step.rb"
require_relative "./trip.rb"

module IRail::NMBS
  class Connection
    include ROXML

    xml_accessor :id,        :as   => Integer, :from => "@id"
    xml_accessor :departure, :as   => Step,    :from => "departure"
    xml_accessor :arrival,   :as   => Step,    :from => "arrival"
    xml_accessor :duration,  :as   => Integer, :from => "duration"
    xml_accessor :trip,      :as   => Trip
  end
end