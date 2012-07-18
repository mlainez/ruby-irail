module IRail::NMBS
  class UnixTime
    include ROXML

    xml_accessor :format, :from => "@formatted"
    xml_accessor :time,   :from => :content
  end
end