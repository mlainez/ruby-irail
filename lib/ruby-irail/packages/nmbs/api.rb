module IRail::API
  class NMBS
    API_URL         = "http://api.irail.be"
    STATIONS_URI    = "stations/"
    CONNECTIONS_URI = "connections/"
    VEHICLE_URI     = "vehicle/"
    DEPARTURES_URI  = "liveboard/"
    ARRIVALS_URI    = "liveboard/"

    def stations(options = {})
      get_resource(:stations, options)
    end

    def connections(origin_station, destination_station, options = {})
      options = build_connections_option_hash(origin_station, destination_station, options)
      get_resource(:connections, options)
    end

    def vehicle(vehicle_id, options = {})
      options = build_vehicle_option_hash(vehicle_id, options)
      get_resource(:vehicle, options)
    end

    def departures(station_id, options = {})
      options = build_departures_option_hash(station_id, options)
      get_resource(:departures, options)
    end

    def arrivals(station_id, options = {})
      options = build_arrivals_option_hash(station_id, options)
      get_resource(:arrivals, options)
    end

    def get_resource(resource, options)
      uri = IRail::API::NMBS.const_get("#{resource.upcase}_URI")
      url = build_url(uri)
      xml = call_api(url, options)
      IRail::NMBS::DocumentParser.send("parse_#{resource}", xml)
    end

    def call_api(url, options = {})
      options = build_query_options_hash(options)
      IRail::Request.get(url, options)
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
      options.merge({ :id => vehicle_id })
    end

    def build_departures_option_hash(station_id, options = {})
      options.merge({
        :id     => station_id,
        :arrdep => "DEP"
      })
    end

    def build_arrivals_option_hash(station_id, options = {})
      options.merge({
        :id     => station_id,
        :arrdep => "ARR"
      })
    end

    def build_url(uri)
      [API_URL, uri].join('/')
    end
  end
end