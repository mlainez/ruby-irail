module IRail::NMBS
  class DocumentParser
    STATION_XPATH = "//station"

    def self.parse_stations(xml_string)
      xml_payload  = Nokogiri::XML(xml_string)
      xml_stations = xml_payload.xpath(STATION_XPATH)
      xml_stations.inject([]) do |stations, xml_station|
        stations << IRail::NMBS::Station.from_xml(xml_station.to_s)
      end
    end
  end
end