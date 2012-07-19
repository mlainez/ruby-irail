require_relative "../../../lib/ruby-irail/packages/nmbs/api.rb"

describe IRail::API::NMBS do
  let(:irail) { IRail::API::NMBS.new }

  describe :connections do
    let(:origin_station)      { mock("Origin station") }
    let(:destination_station) { mock("Destination station") }
    let(:connections_url)     { mock("Connections url") }
    let(:xml_connections)     { mock("Xml connections") }
    let(:connections)         { mock("Connections") }
    let(:connections_options) { mock("Connections options") }
    let(:options)             { mock("Options") }

    before :each do
      irail.stub(:build_url => connections_url)
      irail.stub(:call_api => xml_connections)
      irail.stub(:build_connections_option_hash => connections_options)
      IRail::NMBS::XMLParser.stub(:parse_connections => connections)
    end

    it "builds the connections url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::CONNECTIONS_URI)
      irail.connections(origin_station, destination_station)
    end

    it "builds the connections options" do
      irail.should_receive(:build_connections_option_hash).with(origin_station, destination_station, options)
      irail.connections(origin_station, destination_station, options)
    end

    it "gets the connections" do
      irail.should_receive(:call_api).with(connections_url, connections_options)
      irail.connections(origin_station, destination_station, options)
    end

    it "returns the parsed connections" do
      irail.connections(origin_station, destination_station).should eql connections
    end
  end

  describe :vehicle do
    let(:vehicle_id)      { mock("Vehicle id") }
    let(:vehicle_url)     { mock("Vehicle url") }
    let(:xml_vehicle)     { mock("Xml vehicle") }
    let(:vehicle)         { mock("vehicle") }
    let(:options)         { mock("Options") }
    let(:vehicle_options) { mock("Vehicle options") }

    before :each do
      irail.stub(:build_url => vehicle_url)
      irail.stub(:call_api => xml_vehicle)
      irail.stub(:build_vehicle_option_hash => vehicle_options)
      IRail::NMBS::XMLParser.stub(:parse_vehicle => vehicle)
    end

    it "builds the vehicle url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::VEHICLE_URI)
      irail.vehicle(vehicle_id)
    end

    it "builds the vehicle options" do
      irail.should_receive(:build_vehicle_option_hash).with(vehicle_id, options)
      irail.vehicle(vehicle_id, options)
    end

    it "gets the vehicle" do
      irail.should_receive(:call_api).with(vehicle_url, vehicle_options)
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
      irail.stub(:call_api => xml_station_list)
      IRail::NMBS::XMLParser.stub(:parse_stations => stations)
    end

    it "builds the station list url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::STATIONS_URI)
      irail.stations(options)
    end

    it "gets the xml station list" do
      irail.should_receive(:call_api).with(station_list_url, options)
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
    let(:departures_options) { mock("Departures options") }

    before :each do
      irail.stub(:build_url => liveboard_url)
      irail.stub(:call_api => xml_departures)
      irail.stub(:build_departures_option_hash => departures_options)
      IRail::NMBS::XMLParser.stub(:parse_departures => liveboard)
    end

    it "builds the liveboard url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::DEPARTURES_URI)
      irail.departures(station_id, options)
    end

    it "builds the departures options" do
      irail.should_receive(:build_departures_option_hash).with(station_id, options)
      irail.departures(station_id, options)
    end

    it "gets the departures xml" do
      irail.should_receive(:call_api).with(liveboard_url, departures_options)
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
    let(:arrivals_options) { mock("Arrivals options") }

    before :each do
      irail.stub(:build_url => liveboard_url)
      irail.stub(:call_api => xml_arrivals)
      irail.stub(:build_arrivals_option_hash => arrivals_options)
      IRail::NMBS::XMLParser.stub(:parse_arrivals => liveboard)
    end

    it "builds the liveboard url" do
      irail.should_receive(:build_url).with(IRail::API::NMBS::ARRIVALS_URI)
      irail.arrivals(station_id, options)
    end

    it "builds the departures options" do
      irail.should_receive(:build_arrivals_option_hash).with(station_id, options)
      irail.arrivals(station_id, options)
    end

    it "gets the arrivals xml" do
      irail.should_receive(:call_api).with(liveboard_url, arrivals_options)
      irail.arrivals(station_id, options)
    end

    it "returns the parsed departures" do
      irail.arrivals(station_id, options).should eql liveboard
    end
  end

  describe :call_api do
    let(:url)           { mock("Connections url") }
    let(:options_hash)  { mock("Options hash") }
    let(:response)      { mock("Response") }
    let(:options)       { mock("Oprions") }

    before :each do
      irail.stub(:build_query_options_hash => options_hash)
      IRail::Request.stub(:get => response)
    end

    it "builds the options hash" do
      irail.should_receive(:build_query_options_hash).with(options)
      irail.call_api(url, options)
    end

    it "calls the connections url through a get request" do
      IRail::Request.should_receive(:get).with(url, options_hash)
      irail.call_api(url, options)
    end

    it "returns the response" do
      irail.call_api(url, options).should eql response
    end
  end
end