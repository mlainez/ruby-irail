require_relative '../../../../lib/ruby-irail/packages/nmbs/models/trip.rb'

describe IRail::NMBS::Trip do
  let(:trip) { IRail::NMBS::Trip.new }

  it "has a count of stopovers" do
    trip.should respond_to(:stopover_count)
  end

  it "has stopovers" do
    trip.should respond_to(:stopovers)
  end
end