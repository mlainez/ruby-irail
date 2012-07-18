module IRail::API
  class NMBS
    API_URL         = "http://api.irail.be"
    STATIONS_URI    = "stations/"
    CONNECTIONS_URI = "connections/"
    VEHICLE_URI     = "vehicle/"

    def stations(options = {})
      station_list_url = build_station_list_url
      xml_station_list = get_station_list(station_list_url, options)
      IRail::NMBS::DocumentParser.parse_stations(xml_station_list)
    end

    def connections(origin_station, destination_station, options = {})
      connections_url = build_connections_url
      xml_connections = get_connections(connections_url, origin_station, destination_station, options)
      IRail::NMBS::DocumentParser.parse_connections(xml_connections)
    end

    def vehicle(vehicle_id, options = {})
      vehicle_url = build_vehicle_url
      xml_vehicle = get_vehicle(vehicle_url, vehicle_id, options)
      IRail::NMBS::DocumentParser.parse_vehicle(xml_vehicle)
    end

    def get_station_list(station_list_url, options = {})
      options = { :query => options } if options.any?
      IRail::Request.get(station_list_url, options)
    end

    def get_connections(connections_url, origin_station, destination_station, options = {})
      options = build_connections_option_hash(origin_station, destination_station, options)
      IRail::Request.get(connections_url, options)
    end

    def get_vehicle(vehicle_url, vehicle_id, options = {})
      options = build_vehicle_option_hash(vehicle_id, options)
      IRail::Request.get(vehicle_url, options)
    end

    private
    def build_connections_option_hash(origin_station, destination_station, options = {})
      {
        :query => options.merge({
          :from => origin_station.name,
          :to   => destination_station.name
        })
      }
    end

    def build_vehicle_option_hash(vehicle_id, options = {})
      {
        :query => options.merge({
          :id => vehicle_id
        })
      }
    end

    def build_station_list_url
      [API_URL, STATIONS_URI].join('/')
    end

    def build_connections_url
      [API_URL, CONNECTIONS_URI].join('/')
    end

    def build_vehicle_url
      [API_URL, VEHICLE_URI].join('/')
    end
  end
end