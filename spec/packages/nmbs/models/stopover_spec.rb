require_relative '../../../../lib/ruby-irail/packages/nmbs/models/stopover.rb'

describe IRail::NMBS::Stopover do
  let(:stopover) { IRail::NMBS::Stopover.new }

  it "has an id" do
    stopover.should respond_to(:id)
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
end