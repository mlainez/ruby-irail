require_relative "../../lib/parser/document_parser.rb"

describe DocumentParser do
  module Nokogiri
    module XML
    end
  end

  class StationParser
  end

  class Station
  end

  describe :'self.parse_stations' do
    let(:xml_string)  { mock("Xml string") }
    let(:xml_payload) { mock("Xml payload") }
    let(:stations)    { [ mock("Station"), mock("Station"), mock("Station") ] }
    let(:attributes)  { {} }

    before :each do
      Nokogiri.stub(:XML => xml_payload)
      xml_payload.stub(:xpath => stations)
      StationParser.stub(:parse => attributes)
    end

    it "gets the xml payload from the string passed as parameter" do
      Nokogiri.should_receive(:XML).with(xml_string)
      DocumentParser.parse_stations(xml_string)
    end

    it "extracts the stations from the xml payload" do
      xml_payload.should_receive(:xpath).with(DocumentParser::STATION_XPATH)
      DocumentParser.parse_stations(xml_string)
    end

    it "parses the attributes of all stations" do
      stations.each do |xml_station|
        StationParser.should_receive(:parse).with(xml_station)
      end
      DocumentParser.parse_stations(xml_string)
    end

    it "creates a new station for all parsed station attributes" do
      stations.each do |station|
        Station.should_receive(:new).with(attributes)
      end
      DocumentParser.parse_stations(xml_string)
    end

    it "returns as many stations as in the xml payload" do
      DocumentParser.parse_stations(xml_string).size.should eql stations.size
    end
  end
end