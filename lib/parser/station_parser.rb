module IRail
  class StationParser
    def self.parse(xml_payload)
      id            = parse_station_id(xml_payload)
      latitude      = parse_station_latitude(xml_payload)
      longitude     = parse_station_longitude(xml_payload)
      standard_name = parse_station_standard_name(xml_payload)
      name          = parse_station_name(xml_payload)
      {:id => id, :latitude => latitude, :longitude => longitude,
       :standard_name => standard_name, :name => name}
    end

    def self.parse_station_id(xml_payload)
      xml_payload.attr('id')
    end

    def self.parse_station_latitude(xml_payload)
      xml_payload.attr('locationX')
    end

    def self.parse_station_longitude(xml_payload)
      xml_payload.attr('locationY')
    end

    def self.parse_station_standard_name(xml_payload)
      xml_payload.attr('standardname')
    end

    def self.parse_station_name(xml_payload)
      xml_payload.content
    end
  end
end