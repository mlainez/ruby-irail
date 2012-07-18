require_relative '../../../../lib/ruby-irail/packages/nmbs/models/stopover.rb'

describe IRail::NMBS::Stopover do
  let(:stopover) { IRail::NMBS::Stopover.new }

  it "has an id" do
    stopover.should respond_to(:id)
  end

  it "has a delay" do
    stopover.should respond_to(:delay)
  end

  it "has a station" do
    stopover.should respond_to(:station)
  end

  it "has a vehicle" do
    stopover.should respond_to(:vehicle)
  end

  it "has an arrival" do
    stopover.should respond_to(:arrival)
  end

  it "has a departure" do
    stopover.should respond_to(:departure)
  end

  it "has a direction station" do
    stopover.should respond_to(:direction)
  end

  it "has a wait time in seconds" do
    stopover.should respond_to(:wait_time)
  end

  it "has a unix time" do
    stopover.should respond_to(:unix_time)
  end
end