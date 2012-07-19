require_relative '../../../../lib/ruby-irail/packages/nmbs/models/liveboard.rb'

describe IRail::NMBS::Liveboard do
  let(:liveboard) { IRail::NMBS::Liveboard.new }

  it "has a station" do
    liveboard.should respond_to(:station)
  end

  it "has many departures" do
    liveboard.should respond_to(:departures)
  end

  it "has many arrivals" do
    liveboard.should respond_to(:arrivals)
  end
end