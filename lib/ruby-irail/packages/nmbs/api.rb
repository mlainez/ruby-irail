module IRail::API
  class NMBS
    API_URL         = "http://api.irail.be"
    STATIONS_URI    = "stations/"
    CONNECTIONS_URI = "connections/"
    VEHICLE_URI     = "vehicle/"
    LIVEBOARD_URI   = "liveboard/"

    def stations(options = {})
      station_list_url = build_url(STATIONS_URI)
      xml_station_list = get_stations(station_list_url, options)
      IRail::NMBS::DocumentParser.parse_stations(xml_station_list)
    end

    def connections(origin_station, destination_station, options = {})
      connections_url = build_url(CONNECTIONS_URI)
      xml_connections = get_connections(connections_url, origin_station, destination_station, options)
      IRail::NMBS::DocumentParser.parse_connections(xml_connections)
    end

    def vehicle(vehicle_id, options = {})
      vehicle_url = build_url(VEHICLE_URI)
      xml_vehicle = get_vehicle(vehicle_url, vehicle_id, options)
      IRail::NMBS::DocumentParser.parse_vehicle(xml_vehicle)
    end

    def departures(station_id, options = {})
      liveboard_url  = build_url(LIVEBOARD_URI)
      xml_departures = get_departures(liveboard_url, station_id, options)
      IRail::NMBS::DocumentParser.parse_liveboard(xml_departures)
    end

    def arrivals(station_id, options = {})
      liveboard_url = build_url(LIVEBOARD_URI)
      xml_arrivals  = get_arrivals(liveboard_url, station_id, options)
      IRail::NMBS::DocumentParser.parse_liveboard(xml_arrivals)
    end

    def get_stations(station_list_url, options = {})
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

    def get_departures(liveboard_url, station_id, options = {})
      options = build_departures_option_hash(station_id, options)
      IRail::Request.get(liveboard_url, options)
    end

    def get_arrivals(liveboard_url, station_id, options = {})
      options = build_arrivals_option_hash(station_id, options)
      IRail::Request.get(liveboard_url, options)
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

    def build_departures_option_hash(station_id, options = {})
      {
        :query => options.merge({
          :id     => station_id,
          :arrdep => "DEP"
        })
      }
    end

    def build_arrivals_option_hash(station_id, options = {})
      {
        :query => options.merge({
          :id     => station_id,
          :arrdep => "ARR"
        })
      }
    end

    def build_url(uri)
      [API_URL, uri].join('/')
    end
  end
end