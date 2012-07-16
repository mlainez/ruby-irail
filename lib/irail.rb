API_URL      = "http://api.irail.be"
STATIONS_URI = "stations/"

class IRail
  def stations
    @stations ||= get_stations
  end

  def get_stations
    station_list_url = build_station_list_url
    xml_station_list = get_station_list(station_list_url)
    DocumentParser.parse_stations(xml_station_list)
  end

  def get_station_list(station_list_url)
    Request.get(station_list_url)
  end

  private
  def build_station_list_url
    [API_URL, STATIONS_URI].join('/')
  end
end