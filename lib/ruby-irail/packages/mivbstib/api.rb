module IRail::API
  class MIVBSTIB
    API_URL       = "http://data.irail.be"
    PACKAGE_ID    = "MIVBSTIB"
    STATIONS_URI  = "Stations"
    PARSER_FORMAT = "json"

    def stations
      url  = build_station_list_url
      json = IRail::Request.get(url)
      IRail::MIVBSTIB::JSONParser.parse_stations(json)
    end

    private
    def build_station_list_url
      base_url = [API_URL, PACKAGE_ID, STATIONS_URI].join('/')
      [base_url, PARSER_FORMAT].join('.')
    end
  end
end