require_relative '../../../../lib/ruby-irail/packages/nmbs/models/step.rb'

describe IRail::NMBS::Step do
  let(:step) { IRail::NMBS::Step.new }

  it "has a delay" do
    step.should respond_to(:delay)
  end

  it "has a station" do
    step.should respond_to(:station)
  end

  it "has a unix time" do
    step.should respond_to(:unix_time)
  end

  it "has a vehicle" do
    step.should respond_to(:vehicle)
  end

  it "has a platform" do
    step.should respond_to(:platform)
  end
end