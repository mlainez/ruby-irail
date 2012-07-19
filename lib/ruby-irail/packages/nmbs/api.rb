module IRail::API
  class NMBS
    API_URL         = "http://api.irail.be"
    STATIONS_URI    = "stations/"
    CONNECTIONS_URI = "connections/"
    VEHICLE_URI     = "vehicle/"
    LIVEBOARD_URI   = "liveboard/"

    def stations(options = {})
      get_resource(:stations, options)
    end

    def connections(origin_station, destination_station, options = {})
      options = build_connections_option_hash(origin_station, destination_station, options)
      get_resource(:connections, options)
    end

    def get_resource(resource, options)
      uri = IRail::API::NMBS.const_get("#{resource.upcase}_URI")
      url = build_url(uri)
      xml = send("get_#{resource}", url, options)
      IRail::NMBS::DocumentParser.send("parse_#{resource}", xml)
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
      options = build_query_options_hash(options)
      IRail::Request.get(station_list_url, options)
    end

    def get_connections(connections_url, options = {})
      options = build_query_options_hash(options)
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
    def build_query_options_hash(options)
      { :query => options }
    end

    def build_connections_option_hash(origin_station, destination_station, options = {})
      options.merge({
          :from => origin_station.name,
          :to   => destination_station.name
      })
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