require_relative '../../../../lib/ruby-irail/packages/nmbs/models/vehicle_information.rb'

describe IRail::NMBS::VehicleInformation do
  let(:vehicle_information) { IRail::NMBS::VehicleInformation.new }

  it "has a vehicle" do
    vehicle_information.should respond_to(:vehicle)
  end

  it "has a trip" do
    vehicle_information.should respond_to(:trip)
  end
end