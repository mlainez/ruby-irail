require "roxml"
require_relative "./vehicle.rb"
require_relative "./station.rb"
require_relative "./step.rb"

module IRail::NMBS
  class Stopover
    include ROXML

    xml_name "via"

    xml_accessor :id,        :from => "@id",    :as => Integer
    xml_accessor :delay,     :from => "@delay", :as => Integer
    xml_accessor :station,   :as   => Station
    xml_accessor :vehicle,   :as   => Vehicle
    xml_accessor :arrival,   :as   => Step, :from => "arrival"
    xml_accessor :departure, :as   => Step, :from => "departure"
    xml_accessor :direction, :as   => Station
    xml_reader   :wait_time, :from => "timeBetween", :as => Integer
    xml_accessor :unix_time, :from => "time",        :as => UnixTime
  end
end