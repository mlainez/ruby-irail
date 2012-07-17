module IRail::API
  class MIVBSTIB
    API_URL       = "http://data.irail.be"
    PACKAGE_ID    = "MIVBSTIB"
    STATIONS_URI  = "Stations"
    PARSER_FORMAT = "xml"

    def stations
      @stations ||= get_stations
    end

    def get_stations
      station_list_url = build_station_list_url
      xml_station_list = get_station_list(station_list_url)
      IRail::MIVBSTIB::DocumentParser.parse_stations(xml_station_list)
    end

    def get_station_list(station_list_url)
      IRail::Request.get(station_list_url)
    end

    private
    def build_station_list_url
      base_url = [API_URL, PACKAGE_ID, STATIONS_URI].join('/')
      [base_url, PARSER_FORMAT].join('.')
    end
  end
end