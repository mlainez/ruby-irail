require_relative "../../../../lib/ruby-irail/packages/nmbs/parser/document_parser.rb"

describe IRail::NMBS::DocumentParser do
  module Nokogiri
    module XML
    end
  end

  class IRail::NMBS::Station
  end

  class IRail::NMBS::Connection
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
      IRail::NMBS::DocumentParser.parse_stations(xml_string)
    end

    it "extracts the stations from the xml payload" do
      xml_payload.should_receive(:xpath).with(IRail::NMBS::DocumentParser::STATION_XPATH)
      IRail::NMBS::DocumentParser.parse_stations(xml_string)
    end

    it "creates a new station for all parsed station attributes" do
      stations.each do |station|
        IRail::NMBS::Station.should_receive(:from_xml).with(station.to_s)
      end
      IRail::NMBS::DocumentParser.parse_stations(xml_string)
    end

    it "returns as many stations as in the xml payload" do
      IRail::NMBS::DocumentParser.parse_stations(xml_string).size.should eql stations.size
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
      IRail::NMBS::DocumentParser.parse_connections(xml_string)
    end

    it "extracts the connections from the xml payload" do
      xml_payload.should_receive(:xpath).with(IRail::NMBS::DocumentParser::CONNECTION_XPATH)
      IRail::NMBS::DocumentParser.parse_connections(xml_string)
    end

    it "creates a new connection for all parsed connection attributes" do
      connections.each do |connection|
        IRail::NMBS::Connection.should_receive(:from_xml).with(connection.to_s)
      end
      IRail::NMBS::DocumentParser.parse_connections(xml_string)
    end

    it "returns as many connections as in the xml payload" do
      IRail::NMBS::DocumentParser.parse_connections(xml_string).size.should eql connections.size
    end
  end
end