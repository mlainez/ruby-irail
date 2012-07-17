require_relative "../../../../lib/ruby-irail/packages/mivbstib/parser/station_parser.rb"

describe IRail::MIVBSTIB::StationParser do
  describe :'self.parse' do
    let(:xml_payload)   { mock("Xml Payload") }
    let(:id)            { mock("Station Id") }
    let(:latitude)      { mock("Latitude") }
    let(:longitude)     { mock("Longitude") }
    let(:name)          { mock("Name") }

    before :each do
      IRail::MIVBSTIB::StationParser.stub(parse_station_id: id)
      IRail::MIVBSTIB::StationParser.stub(parse_station_latitude: latitude)
      IRail::MIVBSTIB::StationParser.stub(parse_station_longitude: longitude)
      IRail::MIVBSTIB::StationParser.stub(parse_station_name: name)
    end

    it "parses the id" do
      IRail::MIVBSTIB::StationParser.should_receive(:parse_station_id).with(xml_payload)
      IRail::MIVBSTIB::StationParser.parse(xml_payload)
    end

    it "parses the latitude" do
      IRail::MIVBSTIB::StationParser.should_receive(:parse_station_latitude).with(xml_payload)
      IRail::MIVBSTIB::StationParser.parse(xml_payload)
    end

    it "parses the longitude" do
      IRail::MIVBSTIB::StationParser.should_receive(:parse_station_longitude).with(xml_payload)
      IRail::MIVBSTIB::StationParser.parse(xml_payload)
    end

    it "parses the name" do
      IRail::MIVBSTIB::StationParser.should_receive(:parse_station_name).with(xml_payload)
      IRail::MIVBSTIB::StationParser.parse(xml_payload)
    end

    it "returns a hash containing the parsed attributes" do
      expected = { id: id, latitude: latitude, longitude: longitude, name: name}
      IRail::MIVBSTIB::StationParser.parse(xml_payload).should eql expected
    end
  end
end