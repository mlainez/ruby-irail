class DocumentParser
  STATION_XPATH = "//station"

  def self.parse_stations(xml_string)
    xml_payload  = Nokogiri::XML(xml_string)
    xml_stations = xml_payload.xpath(STATION_XPATH)
    xml_stations.inject([]) do |stations, xml_station|
      attributes = StationParser.parse(xml_station)
      stations << Station.new(attributes)
    end
  end
end