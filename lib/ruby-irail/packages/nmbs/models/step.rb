require "roxml"
require_relative "./station.rb"
require_relative "./unix_time.rb"
require_relative "./vehicle.rb"
require_relative "./platform.rb"

module IRail::NMBS
  class Step
    include ROXML

    xml_accessor :delay,     :from => "@delay", :as => Integer
    xml_accessor :station,   :as   => Station
    xml_accessor :unix_time, :as   => UnixTime
    xml_accessor :vehicle,   :as   => Vehicle
    xml_accessor :platform,  :as   => Platform
  end
end