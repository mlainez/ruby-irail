require_relative "../../../lib/ruby-irail/packages/nmbs/api.rb"

describe IRail::API::NMBS do
  let(:irail) { IRail::API::NMBS.new }

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

  describe :connections do
    let(:origin_station)      { mock("Origin station") }
    let(:destination_station) { mock("Destination station") }
    let(:connections_url)     { mock("Connections url") }
    let(:xml_connections)     { mock("Xml connections") }
    let(:connections)         { mock("Connections") }

    before :each do
      irail.stub(:build_connections_url => connections_url)
      irail.stub(:get_connections => xml_connections)
      IRail::NMBS::DocumentParser.stub(:parse_connections => connections)
    end

    it "builds the connections url" do
      irail.should_receive(:build_connections_url)
      irail.connections(origin_station, destination_station)
    end

    it "gets the connections" do
      irail.should_receive(:get_connections).with(connections_url, origin_station, destination_station)
      irail.connections(origin_station, destination_station)
    end

    it "returns the parsed connections" do
      irail.connections(origin_station, destination_station).should eql connections
    end
  end

  describe :get_stations do
    let(:station_list_url) { mock("Url") }
    let(:xml_station_list) { mock("Xml station list") }
    let(:stations)         { mock("Stations") }

    before :each do
      irail.stub(:build_station_list_url => station_list_url)
      irail.stub(:get_station_list => xml_station_list)
      IRail::NMBS::DocumentParser.stub(:parse_stations => stations)
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

  describe :get_connections do
    let(:origin_station)      { mock("Origin station") }
    let(:destination_station) { mock("Destination station") }
    let(:connections_url)     { mock("Connections url") }
    let(:options_hash)        { mock("Options hash") }
    let(:response)            { mock("Response") }

    before :each do
      irail.stub(:build_connections_option_hash => options_hash)
      IRail::Request.stub(:get => response)
    end

    it "builds the options hash" do
      irail.should_receive(:build_connections_option_hash).with(origin_station, destination_station)
      irail.get_connections(connections_url, origin_station, destination_station)
    end

    it "calls the connections url through a get request" do
      IRail::Request.should_receive(:get).with(connections_url, options_hash)
      irail.get_connections(connections_url, origin_station, destination_station)
    end

    it "returns the response" do
      irail.get_connections(connections_url, origin_station, destination_station).should eql response
    end
  end

  describe :get_station_list do
    let(:url)      { mock("Url") }
    let(:response) { mock("Response") }

    before :each do
      IRail::Request.stub(:get => response)
    end

    it "calls the station list url through a get request" do
      IRail::Request.should_receive(:get).with(url)
      irail.get_station_list(url)
    end

    it "returns the response" do
      irail.get_station_list(url).should eql response
    end
  end
end