module IRail::NMBS
  class DocumentParser
    STATION_XPATH    = "//station"
    CONNECTION_XPATH = "//connection"
    VEHICLE_XPATH    = "//vehicleinformation"

    def self.parse_stations(xml_string)
      xml_payload(xml_string, STATION_XPATH).inject([]) do |stations, xml_station|
        stations << IRail::NMBS::Station.from_xml(xml_station.to_s)
      end
    end

    def self.parse_connections(xml_string)
      xml_payload(xml_string, CONNECTION_XPATH).inject([]) do |connections, xml_connection|
        connections << IRail::NMBS::Connection.from_xml(xml_connection.to_s)
      end
    end

    def self.parse_vehicle(xml_string)
      vehicle = xml_payload(xml_string, VEHICLE_XPATH)
      IRail::NMBS::VehicleInformation.from_xml(vehicle.to_s)
    end

    def self.parse_liveboard(xml_string)
      IRail::NMBS::Liveboard.from_xml(xml_string)
    end

    class << self
      alias :parse_departures :parse_liveboard
      alias :parse_arrivals :parse_liveboard
    end

    def self.xml_payload(xml_string, xpath)
      xml_payload = Nokogiri::XML(xml_string)
      xml_payload.xpath(xpath)
    end
  end
end