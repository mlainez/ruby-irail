API_URL      = "http://api.irail.be"
STATIONS_URI = "stations/"

module IRail
  class API
    def stations
      @stations ||= get_stations
    end

    def get_stations
      station_list_url = build_station_list_url
      xml_station_list = get_station_list(station_list_url)
      IRail::DocumentParser.parse_stations(xml_station_list)
    end

    def get_station_list(station_list_url)
      IRail::Request.get(station_list_url)
    end

    private
    def build_station_list_url
      [API_URL, STATIONS_URI].join('/')
    end
  end
end