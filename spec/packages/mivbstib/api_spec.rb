require_relative "../../../lib/ruby-irail/packages/mivbstib/api.rb"

describe IRail::API::MIVBSTIB do
  let(:irail) { IRail::API::MIVBSTIB.new }
  let(:url)   { mock("Stations url") }
  let(:json)  { mock("Json stations") }
  let(:stations) { mock("Stations") }

  before :each do
    irail.stub(:build_station_list_url => url)
    IRail::Request.stub(:get => json)
    IRail::MIVBSTIB::JSONParser.stub(:parse_stations => stations)
  end

  describe :stations do
    it "builds the station url" do
      irail.should_receive(:build_station_list_url)
      irail.stations
    end

    it "calls the api" do
      IRail::Request.should_receive(:get).with(url)
      irail.stations
    end

    it "parses the returned json" do
      IRail::MIVBSTIB::JSONParser.should_receive(:parse_stations).with(json)
      irail.stations
    end

    it "returns the stations" do
      irail.stations.should eql stations
    end
  end
end