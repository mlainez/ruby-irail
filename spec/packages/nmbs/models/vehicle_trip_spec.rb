require_relative '../../../../lib/ruby-irail/packages/nmbs/models/vehicle_trip.rb'

describe IRail::NMBS::VehicleTrip do
  let(:vehicle_trip) { IRail::NMBS::VehicleTrip.new }

  it "has a count of the number of stops" do
    vehicle_trip.should respond_to(:stop_count)
  end

  it "has many stops" do
    vehicle_trip.should respond_to(:stops)
  end
end