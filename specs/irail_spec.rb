require_relative "../lib/irail.rb"

describe IRail do
  let(:irail) { IRail.new }

  describe :stations do
    let(:stations)         { mock("Stations") }
    let(:fetched_stations) { mock("Fetched stations") }

    before :each do
      irail.stub(:get_stations => fetched_stations)
    end

    it "returns the stations when they were already fetched" do
      irail.instance_variable_set(:@stations, stations)
      irail.stations.should eql stations
    end

    context "when stations have not been fetched yet" do
      it "fetches them" do
        irail.should_receive(:get_stations)
        irail.stations
      end

      it "returns them" do
        irail.stations.should eql fetched_stations
      end
    end
  end

  describe :get_stations do
    let(:station_list_url) { mock("Url") }
    let(:xml_station_list) { mock("Xml station list") }
    let(:stations)         { mock("Stations") }

    before :each do
      irail.stub(:build_station_list_url => station_list_url)
      irail.stub(:get_station_list => xml_station_list)
      DocumentParser.stub(:parse_stations => stations)
    end

    it "builds the station list url" do
      irail.should_receive(:build_station_list_url)
      irail.get_stations
    end

    it "gets the xml station list" do
      irail.should_receive(:get_station_list).with(station_list_url)
      irail.get_stations
    end

    it "returns the parsed stations" do
      irail.get_stations.should eql stations
    end
  end

  describe :get_station_list do
    let(:url)      { mock("Url") }
    let(:response) { mock("Response") }

    before :each do
      Request.stub(:get => response)
    end

    it "calls the station list url through a get request" do
      Request.should_receive(:get).with(url)
      irail.get_station_list(url)
    end

    it "returns the response" do
      irail.get_station_list(url).should eql response
    end
  end
end