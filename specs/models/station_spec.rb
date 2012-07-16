require_relative '../../lib/models/station.rb'

describe Station do
  let(:station) { Station.new }

  it "has an id" do
    station.should respond_to(:id)
  end

  it "has an latitude" do
    station.should respond_to(:latitude)
  end

  it "has an longitude" do
    station.should respond_to(:longitude)
  end

  it "has a standard name" do
    station.should respond_to(:standard_name)
  end

  it "has a name" do
    station.should respond_to(:name)
  end
end