require "roxml"

module IRail::NMBS
  class UnixTime
    include ROXML

    xml_name "time"

    xml_accessor :format, :from => "@formatted"
    xml_accessor :time,   :from => :content
  end
end