require "json"

module IRail::MIVBSTIB
  class JSONParser
    STATIONS_KEY = "Stations"

    def self.parse_stations(json_string)
      json_hash      = JSON.parse(json_string)
      stations_json  = json_hash[STATIONS_KEY]
      stations_json.inject([]) do |stations, station_attributes|
        stations << IRail::MIVBSTIB::Station.new(station_attributes)
      end
    end
  end
end