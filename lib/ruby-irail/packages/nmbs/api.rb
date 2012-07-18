module IRail::API
  class NMBS
    API_URL         = "http://api.irail.be"
    STATIONS_URI    = "stations/"
    CONNECTIONS_URI = "connections/"

    def stations
      @stations ||= get_stations
    end

    def connections(origin_station, destination_station)
      connections_url = build_connections_url
      xml_connections = get_connections(connections_url, origin_station, destination_station)
      IRail::NMBS::DocumentParser.parse_connections(xml_connections)
    end

    def get_stations
      station_list_url = build_station_list_url
      xml_station_list = get_station_list(station_list_url)
      IRail::NMBS::DocumentParser.parse_stations(xml_station_list)
    end

    def get_connections(connections_url, origin_station, destination_station)
      options = build_connections_option_hash(origin_station, destination_station)
      IRail::Request.get(connections_url, options)
    end

    def get_station_list(station_list_url)
      IRail::Request.get(station_list_url)
    end

    private
    def build_connections_option_hash(origin_station, destination_station)
      {
        :query => {
          :from => origin_station.name,
          :to   => destination_station.name }
      }
    end

    def build_station_list_url
      [API_URL, STATIONS_URI].join('/')
    end

    def build_connections_url
      [API_URL, CONNECTIONS_URI].join('/')
    end
  end
end