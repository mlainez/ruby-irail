require_relative '../../../../lib/ruby-irail/packages/nmbs/models/vehicle.rb'

describe IRail::NMBS::Vehicle do
  let(:vehicle) { IRail::NMBS::Vehicle.new }

  it "has an id" do
    vehicle.should respond_to(:id)
  end
end