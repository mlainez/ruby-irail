require_relative '../../../../lib/ruby-irail/packages/mivbstib/models/station.rb'

describe IRail::MIVBSTIB::Station do
  let(:station) { IRail::MIVBSTIB::Station.new }

  it "has an id" do
    station.should respond_to(:id)
  end

  it "has an latitude" do
    station.should respond_to(:latitude)
  end

  it "has an longitude" do
    station.should respond_to(:longitude)
  end

  it "has a name" do
    station.should respond_to(:name)
  end
end