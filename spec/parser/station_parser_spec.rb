require_relative "../../lib/ruby-irail/parser/station_parser.rb"

describe IRail::StationParser do
  describe :'self.parse' do
    let(:xml_payload)   { mock("Xml Payload") }
    let(:id)            { mock("Station Id") }
    let(:latitude)      { mock("Latitude") }
    let(:longitude)     { mock("Longitude") }
    let(:standard_name) { mock("Standard Name") }
    let(:name)          { mock("Name") }

    before :each do
      IRail::StationParser.stub(parse_station_id: id)
      IRail::StationParser.stub(parse_station_latitude: latitude)
      IRail::StationParser.stub(parse_station_longitude: longitude)
      IRail::StationParser.stub(parse_station_standard_name: standard_name)
      IRail::StationParser.stub(parse_station_name: name)
    end

    it "parses the id" do
      IRail::StationParser.should_receive(:parse_station_id).with(xml_payload)
      IRail::StationParser.parse(xml_payload)
    end

    it "parses the latitude" do
      IRail::StationParser.should_receive(:parse_station_latitude).with(xml_payload)
      IRail::StationParser.parse(xml_payload)
    end

    it "parses the longitude" do
      IRail::StationParser.should_receive(:parse_station_longitude).with(xml_payload)
      IRail::StationParser.parse(xml_payload)
    end

    it "parses the standard name" do
      IRail::StationParser.should_receive(:parse_station_standard_name).with(xml_payload)
      IRail::StationParser.parse(xml_payload)
    end

    it "parses the name" do
      IRail::StationParser.should_receive(:parse_station_name).with(xml_payload)
      IRail::StationParser.parse(xml_payload)
    end

    it "returns a hash containing the parsed attributes" do
      expected = { id: id, latitude: latitude, longitude: longitude, standard_name: standard_name, name: name}
      IRail::StationParser.parse(xml_payload).should eql expected
    end
  end
end