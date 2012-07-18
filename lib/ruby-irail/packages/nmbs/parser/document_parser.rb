module IRail::NMBS
  class DocumentParser
    STATION_XPATH    = "//station"
    CONNECTION_XPATH = "//connection"
    VEHICLE_XPATH    = "//vehicleinformation"

    def self.parse_stations(xml_string)
      xml_stations(xml_string).inject([]) do |stations, xml_station|
        stations << IRail::NMBS::Station.from_xml(xml_station.to_s)
      end
    end

    def self.parse_connections(xml_string)
      xml_connections(xml_string).inject([]) do |connections, xml_connection|
        connections << IRail::NMBS::Connection.from_xml(xml_connection.to_s)
      end
    end

    def self.parse_vehicle(xml_string)
      vehicle = xml_vehicle(xml_string)
      IRail::NMBS::VehicleInformation.from_xml(vehicle.to_s)
    end

    def self.xml_vehicle(xml_string)
      xml_payload = Nokogiri::XML(xml_string)
      xml_payload.xpath(VEHICLE_XPATH)
    end

    def self.xml_stations(xml_string)
      xml_payload = Nokogiri::XML(xml_string)
      xml_payload.xpath(STATION_XPATH)
    end

    def self.xml_connections(xml_string)
      xml_payload = Nokogiri::XML(xml_string)
      xml_payload.xpath(CONNECTION_XPATH)
    end
  end
end