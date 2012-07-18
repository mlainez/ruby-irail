require_relative "../../../../lib/ruby-irail/packages/mivbstib/parser/document_parser.rb"

describe IRail::MIVBSTIB::DocumentParser do
  module Nokogiri
    module XML
    end
  end

  class IRail::MIVBSTIB::StationParser
  end

  class IRail::MIVBSTIB::Station
  end

  describe :'self.parse_stations' do
    let(:xml_string)  { mock("Xml string") }
    let(:xml_payload) { mock("Xml payload") }
    let(:stations)    { [ mock("Station"), mock("Station"), mock("Station") ] }
    let(:attributes)  { {} }

    before :each do
      Nokogiri.stub(:XML => xml_payload)
      xml_payload.stub(:xpath => stations)
      IRail::MIVBSTIB::StationParser.stub(:parse => attributes)
    end

    it "gets the xml payload from the string passed as parameter" do
      Nokogiri.should_receive(:XML).with(xml_string)
      IRail::MIVBSTIB::DocumentParser.parse_stations(xml_string)
    end

    it "extracts the stations from the xml payload" do
      xml_payload.should_receive(:xpath).with(IRail::MIVBSTIB::DocumentParser::STATION_XPATH)
      IRail::MIVBSTIB::DocumentParser.parse_stations(xml_string)
    end

    it "parses the attributes of all stations" do
      stations.each do |xml_station|
        IRail::MIVBSTIB::StationParser.should_receive(:parse).with(xml_station)
      end
      IRail::MIVBSTIB::DocumentParser.parse_stations(xml_string)
    end

    it "creates a new station for all parsed station attributes" do
      stations.each do |station|
        IRail::MIVBSTIB::Station.should_receive(:new).with(attributes)
      end
      IRail::MIVBSTIB::DocumentParser.parse_stations(xml_string)
    end

    it "returns as many stations as in the xml payload" do
      IRail::MIVBSTIB::DocumentParser.parse_stations(xml_string).size.should eql stations.size
    end
  end
end