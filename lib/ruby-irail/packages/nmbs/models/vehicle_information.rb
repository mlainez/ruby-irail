require "roxml"
require_relative "./vehicle.rb"
require_relative "./vehicle_trip.rb"

module IRail::NMBS
  class VehicleInformation
    include ROXML

    xml_accessor :vehicle, :as   => Vehicle
    xml_accessor :trip,    :from => "stops", :as => VehicleTrip
  end
end