require_relative "../../../../lib/ruby-irail/packages/nmbs/parser/xml_parser.rb"

describe IRail::NMBS::XMLParser do
  module Nokogiri
    module XML
    end
  end

  class IRail::NMBS::Station
  end

  class IRail::NMBS::Connection
  end

  class IRail::NMBS::Liveboard
  end

  describe :'self.parse_stations' do
    let(:xml_string)  { mock("Xml string") }
    let(:xml_payload) { mock("Xml payload") }
    let(:stations)    { [ mock("Station"), mock("Station"), mock("Station") ] }

    before :each do
      Nokogiri.stub(:XML => xml_payload)
      xml_payload.stub(:xpath => stations)
      IRail::NMBS::Station.stub(:from_xml)
    end

    it "gets the xml payload from the string passed as parameter" do
      Nokogiri.should_receive(:XML).with(xml_string)
      IRail::NMBS::XMLParser.parse_stations(xml_string)
    end

    it "extracts the stations from the xml payload" do
      xml_payload.should_receive(:xpath).with(IRail::NMBS::XMLParser::STATION_XPATH)
      IRail::NMBS::XMLParser.parse_stations(xml_string)
    end

    it "creates a new station for all parsed station attributes" do
      stations.each do |station|
        IRail::NMBS::Station.should_receive(:from_xml).with(station.to_s)
      end
      IRail::NMBS::XMLParser.parse_stations(xml_string)
    end

    it "returns as many stations as in the xml payload" do
      IRail::NMBS::XMLParser.parse_stations(xml_string).size.should eql stations.size
    end
  end

  describe :'self.parse_connections' do
    let(:xml_string)  { mock("Xml string") }
    let(:xml_payload) { mock("Xml payload") }
    let(:connections) { [ mock("Connection"), mock("Connection"), mock("Connection") ] }

    before :each do
      Nokogiri.stub(:XML => xml_payload)
      xml_payload.stub(:xpath => connections)
      IRail::NMBS::Connection.stub(:from_xml)
    end

    it "gets the xml payload from the string passed as parameter" do
      Nokogiri.should_receive(:XML).with(xml_string)
      IRail::NMBS::XMLParser.parse_connections(xml_string)
    end

    it "extracts the connections from the xml payload" do
      xml_payload.should_receive(:xpath).with(IRail::NMBS::XMLParser::CONNECTION_XPATH)
      IRail::NMBS::XMLParser.parse_connections(xml_string)
    end

    it "creates a new connection for all parsed connection attributes" do
      connections.each do |connection|
        IRail::NMBS::Connection.should_receive(:from_xml).with(connection.to_s)
      end
      IRail::NMBS::XMLParser.parse_connections(xml_string)
    end

    it "returns as many connections as in the xml payload" do
      IRail::NMBS::XMLParser.parse_connections(xml_string).size.should eql connections.size
    end
  end

  describe :'self.parse_vehicle' do
    let(:xml_string)       { mock("Xml string") }
    let(:xml_payload)      { mock("Xml payload") }
    let(:vehicle)          { mock("Vehicle") }
    let(:vehicle_instance) { mock("Vehicle instance") }

    before :each do
      Nokogiri.stub(:XML => xml_payload)
      xml_payload.stub(:xpath => vehicle)
      IRail::NMBS::VehicleInformation.stub(:from_xml => vehicle_instance)
    end

    it "gets the xml payload from the string passed as parameter" do
      Nokogiri.should_receive(:XML).with(xml_string)
      IRail::NMBS::XMLParser.parse_vehicle(xml_string)
    end

    it "extracts the vehicle from the xml payload" do
      xml_payload.should_receive(:xpath).with(IRail::NMBS::XMLParser::VEHICLE_XPATH)
      IRail::NMBS::XMLParser.parse_vehicle(xml_string)
    end

    it "creates a new vehicle for the parsed vehicle attributes" do
      IRail::NMBS::VehicleInformation.should_receive(:from_xml).with(vehicle.to_s)
      IRail::NMBS::XMLParser.parse_vehicle(xml_string)
    end

    it "returns a vehicule instance" do
      IRail::NMBS::XMLParser.parse_vehicle(xml_string).should eql vehicle_instance
    end
  end

  describe :'self.parse_liveboard' do
    let(:xml_string)         { mock("Xml string") }
    let(:liveboard)          { mock("Loveboard") }
    let(:liveboard_instance) { mock("Liveboard instance") }

    before :each do
      IRail::NMBS::Liveboard.stub(:from_xml => liveboard_instance)
    end

    it "creates a liveboard from the xml payload" do
      IRail::NMBS::Liveboard.should_receive(:from_xml).with(xml_string)
      IRail::NMBS::XMLParser.parse_liveboard(xml_string)
    end

    it "returns a liveboard instance" do
      IRail::NMBS::XMLParser.parse_liveboard(xml_string).should eql liveboard_instance
    end
  end
end