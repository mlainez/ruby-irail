require_relative "../../../lib/ruby-irail/nmbs/parser/document_parser.rb"

describe IRail::NMBS::DocumentParser do
  module Nokogiri
    module XML
    end
  end

  class IRail::NMBS::StationParser
  end

  class IRail::NMBS::Station
  end

  describe :'self.parse_stations' do
    let(:xml_string)  { mock("Xml string") }
    let(:xml_payload) { mock("Xml payload") }
    let(:stations)    { [ mock("Station"), mock("Station"), mock("Station") ] }
    let(:attributes)  { {} }

    before :each do
      Nokogiri.stub(:XML => xml_payload)
      xml_payload.stub(:xpath => stations)
      IRail::NMBS::StationParser.stub(:parse => attributes)
    end

    it "gets the xml payload from the string passed as parameter" do
      Nokogiri.should_receive(:XML).with(xml_string)
      IRail::NMBS::DocumentParser.parse_stations(xml_string)
    end

    it "extracts the stations from the xml payload" do
      xml_payload.should_receive(:xpath).with(IRail::NMBS::DocumentParser::STATION_XPATH)
      IRail::NMBS::DocumentParser.parse_stations(xml_string)
    end

    it "parses the attributes of all stations" do
      stations.each do |xml_station|
        IRail::NMBS::StationParser.should_receive(:parse).with(xml_station)
      end
      IRail::NMBS::DocumentParser.parse_stations(xml_string)
    end

    it "creates a new station for all parsed station attributes" do
      stations.each do |station|
        IRail::NMBS::Station.should_receive(:new).with(attributes)
      end
      IRail::NMBS::DocumentParser.parse_stations(xml_string)
    end

    it "returns as many stations as in the xml payload" do
      IRail::NMBS::DocumentParser.parse_stations(xml_string).size.should eql stations.size
    end
  end
end