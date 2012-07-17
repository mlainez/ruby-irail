module IRail::MIVBSTIB
  class StationParser
    def self.parse(xml_payload)
      id            = parse_station_id(xml_payload)
      latitude      = parse_station_latitude(xml_payload)
      longitude     = parse_station_longitude(xml_payload)
      name          = parse_station_name(xml_payload)
      {id: id, latitude: latitude, longitude: longitude, name: name}
    end

    def self.parse_station_id(xml_payload)
      xml_payload.xpath('id').text.strip
    end

    def self.parse_station_latitude(xml_payload)
      xml_payload.xpath('latitude').text.strip
    end

    def self.parse_station_longitude(xml_payload)
      xml_payload.xpath('longitude').text.strip
    end

    def self.parse_station_name(xml_payload)
      xml_payload.xpath('name').text.strip
    end
  end
end