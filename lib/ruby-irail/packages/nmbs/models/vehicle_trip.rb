require "roxml"
require_relative "./stopover.rb"

module IRail::NMBS
  class VehicleTrip
    include ROXML

    xml_name 'stops'

    xml_accessor :stop_count, :from => "@number", :as => Integer
    xml_accessor :stops,      :from => "stop",    :as => [Stopover]
  end
end