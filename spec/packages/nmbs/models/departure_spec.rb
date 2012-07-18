require_relative '../../../../lib/ruby-irail/packages/nmbs/models/departure.rb'

describe IRail::NMBS::Departure do
  let(:departure) { IRail::NMBS::Departure.new }

  it "has a delay" do
    departure.should respond_to(:delay)
  end

  it "has a station" do
    departure.should respond_to(:station)
  end

  it "has a unix time" do
    departure.should respond_to(:unix_time)
  end

  it "has a vehicle" do
    departure.should respond_to(:vehicle)
  end

  it "has a platform" do
    departure.should respond_to(:platform)
  end
end