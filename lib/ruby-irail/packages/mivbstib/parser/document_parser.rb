module IRail::MIVBSTIB
  class DocumentParser
    STATION_XPATH = "//Stations"

    def self.parse_stations(xml_string)
      xml_payload  = Nokogiri::XML(xml_string)
      xml_stations = xml_payload.xpath(STATION_XPATH)
      xml_stations.inject([]) do |stations, xml_station|
        attributes = IRail::MIVBSTIB::StationParser.parse(xml_station)
        stations << IRail::MIVBSTIB::Station.new(attributes)
      end
    end
  end
end