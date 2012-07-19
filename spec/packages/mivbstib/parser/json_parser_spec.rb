require_relative "../../../../lib/ruby-irail/packages/mivbstib/parser/json_parser.rb"

describe IRail::MIVBSTIB::JSONParser do
  class IRail::MIVBSTIB::Station
  end

  describe :'self.parse_stations' do
    let(:json_string)   { mock("Json string") }
    let(:json_stations) { [ IRail::MIVBSTIB::Station.new, IRail::MIVBSTIB::Station.new, IRail::MIVBSTIB::Station.new ] }
    let(:station)       { mock("Station") }

    before :each do
      JSON.stub(:parse => {"Stations" => json_stations})
      IRail::MIVBSTIB::Station.stub(:new => station)
    end

    it "parses the json" do
      JSON.should_receive(:parse).with(json_string)
      IRail::MIVBSTIB::JSONParser.parse_stations(json_string)
    end

    it "creates a station for each json station" do
      json_stations.each do |station|
        IRail::MIVBSTIB::Station.should_receive(:new).with(station)
      end
      IRail::MIVBSTIB::JSONParser.parse_stations(json_string)
    end

    it "returns the stations" do
      IRail::MIVBSTIB::JSONParser.parse_stations(json_string).should eql [ station, station, station ]
    end
  end
end