require_relative "../../../lib/ruby-irail/packages/nmbs/api.rb"

describe IRail::API::NMBS do
  let(:irail) { IRail::API::NMBS.new }

  describe :connections do
    let(:origin_station)      { mock("Origin station") }
    let(:destination_station) { mock("Destination station") }
    let(:connections_url)     { mock("Connections url") }
    let(:xml_connections)     { mock("Xml connections") }
    let(:connections)         { mock("Connections") }
    let(:options)             { mock("Options") }

    before :each do
      irail.stub(:build_url => connections_url)
      irail.stub(:get_connections => xml_connections)
      IRail::NMBS::DocumentParser.stub(:parse_connections => connections)
    end

    it "builds the connections url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::CONNECTIONS_URI)
      irail.connections(origin_station, destination_station)
    end

    it "gets the connections" do
      irail.should_receive(:get_connections).with(connections_url, origin_station, destination_station, options)
      irail.connections(origin_station, destination_station, options)
    end

    it "returns the parsed connections" do
      irail.connections(origin_station, destination_station).should eql connections
    end
  end

  describe :vehicle do
    let(:vehicle_id)  { mock("Vehicle id") }
    let(:vehicle_url) { mock("Vehicle url") }
    let(:xml_vehicle) { mock("Xml vehicle") }
    let(:vehicle)     { mock("vehicle") }
    let(:options)     { mock("Options") }

    before :each do
      irail.stub(:build_url => vehicle_url)
      irail.stub(:get_vehicle => xml_vehicle)
      IRail::NMBS::DocumentParser.stub(:parse_vehicle => vehicle)
    end

    it "builds the vehicle url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::VEHICLE_URI)
      irail.vehicle(vehicle_id)
    end

    it "gets the vehicle" do
      irail.should_receive(:get_vehicle).with(vehicle_url, vehicle_id, options)
      irail.vehicle(vehicle_id, options)
    end

    it "returns the parsed vehicle" do
      irail.vehicle(vehicle_id, options).should eql vehicle
    end
  end

  describe :stations do
    let(:station_list_url) { mock("Url") }
    let(:xml_station_list) { mock("Xml station list") }
    let(:stations)         { mock("Stations") }
    let(:options)          { mock("Options") }

    before :each do
      irail.stub(:build_url => station_list_url)
      irail.stub(:get_stations => xml_station_list)
      IRail::NMBS::DocumentParser.stub(:parse_stations => stations)
    end

    it "builds the station list url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::STATIONS_URI)
      irail.stations(options)
    end

    it "gets the xml station list" do
      irail.should_receive(:get_stations).with(station_list_url, options)
      irail.stations(options)
    end

    it "returns the parsed stations" do
      irail.stations(options).should eql stations
    end
  end

  describe :departures do
    let(:liveboard_url)  { mock("Url") }
    let(:station_id)     { mock("Station id") }
    let(:options)        { mock("Options") }
    let(:liveboard)      { mock("Liveboard") }
    let(:xml_departures) { mock("Xml departures") }

    before :each do
      irail.stub(:build_url => liveboard_url)
      irail.stub(:get_departures => xml_departures)
      IRail::NMBS::DocumentParser.stub(:parse_liveboard => liveboard)
    end

    it "builds the liveboard url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::LIVEBOARD_URI)
      irail.departures(station_id, options)
    end

    it "gets the departures xml" do
      irail.should_receive(:get_departures).with(liveboard_url, station_id, options)
      irail.departures(station_id, options)
    end

    it "returns the liveboard" do
      irail.departures(station_id, options).should eql liveboard
    end
  end

  describe :arrivals do
    let(:liveboard_url)  { mock("Url") }
    let(:station_id)     { mock("Station id") }
    let(:options)        { mock("Options") }
    let(:liveboard)      { mock("Liveboard") }
    let(:xml_arrivals)   { mock("Xml arrivals") }

    before :each do
      irail.stub(:build_url => liveboard_url)
      irail.stub(:get_arrivals => xml_arrivals)
      IRail::NMBS::DocumentParser.stub(:parse_liveboard => liveboard)
    end

    it "builds the liveboard url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::LIVEBOARD_URI)
      irail.arrivals(station_id, options)
    end

    it "gets the arrivals xml" do
      irail.should_receive(:get_arrivals).with(liveboard_url, station_id, options)
      irail.arrivals(station_id, options)
    end

    it "returns the parsed departures" do
      irail.arrivals(station_id, options).should eql liveboard
    end
  end

  describe :get_connections do
    let(:origin_station)      { mock("Origin station") }
    let(:destination_station) { mock("Destination station") }
    let(:connections_url)     { mock("Connections url") }
    let(:options_hash)        { mock("Options hash") }
    let(:response)            { mock("Response") }
    let(:options)             { mock("Oprions") }

    before :each do
      irail.stub(:build_connections_option_hash => options_hash)
      IRail::Request.stub(:get => response)
    end

    it "builds the options hash" do
      irail.should_receive(:build_connections_option_hash).with(origin_station, destination_station, options)
      irail.get_connections(connections_url, origin_station, destination_station, options)
    end

    it "calls the connections url through a get request" do
      IRail::Request.should_receive(:get).with(connections_url, options_hash)
      irail.get_connections(connections_url, origin_station, destination_station)
    end

    it "returns the response" do
      irail.get_connections(connections_url, origin_station, destination_station).should eql response
    end
  end

  describe :get_departures do
    let(:station_id)    { mock("Station id") }
    let(:options)       { mock("Options") }
    let(:liveboard_url) { mock("Liveboard url") }
    let(:options_hash)  { mock("Options hash") }
    let(:response)      { mock("Response") }

    before :each do
      irail.stub(:build_departures_option_hash => options_hash)
      IRail::Request.stub(:get => response)
    end

    it "builds the options hash" do
      irail.should_receive(:build_departures_option_hash).with(station_id, options)
      irail.get_departures(liveboard_url, station_id, options)
    end

    it "calls the connections url through a get request" do
      IRail::Request.should_receive(:get).with(liveboard_url, options_hash)
      irail.get_departures(liveboard_url, station_id, options)
    end

    it "returns the response" do
      irail.get_departures(liveboard_url, station_id, options).should eql response
    end
  end

  describe :get_arrivals do
    let(:station_id)    { mock("Station id") }
    let(:options)       { mock("Options") }
    let(:liveboard_url) { mock("Liveboard url") }
    let(:options_hash)  { mock("Options hash") }
    let(:response)      { mock("Response") }

    before :each do
      irail.stub(:build_arrivals_option_hash => options_hash)
      IRail::Request.stub(:get => response)
    end

    it "builds the options hash" do
      irail.should_receive(:build_arrivals_option_hash).with(station_id, options)
      irail.get_arrivals(liveboard_url, station_id, options)
    end

    it "calls the connections url through a get request" do
      IRail::Request.should_receive(:get).with(liveboard_url, options_hash)
      irail.get_arrivals(liveboard_url, station_id, options)
    end

    it "returns the response" do
      irail.get_arrivals(liveboard_url, station_id, options).should eql response
    end
  end

  describe :get_stations do
    let(:url)      { mock("Url") }
    let(:response) { mock("Response") }

    before :each do
      IRail::Request.stub(:get => response)
    end

    context "when there are no options" do
      let(:options) { {} }

      it "calls the station list url through a get request" do
        IRail::Request.should_receive(:get).with(url, options)
        irail.get_stations(url, options)
      end

      it "returns the response" do
        irail.get_stations(url, options).should eql response
      end
    end

    context "when there are options" do
      let(:options) { {:a => 1} }

      it "calls the station list url with query options" do
        expected_options = { :query => options }
        IRail::Request.should_receive(:get).with(url, expected_options)
        irail.get_stations(url, options)
      end

      it "returns the response" do
        irail.get_stations(url, options).should eql response
      end
    end
  end
end