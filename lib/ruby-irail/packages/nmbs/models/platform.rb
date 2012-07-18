module IRail::NMBS
  class Platform
    include ROXML

    xml_accessor :number, :from => :content
  end
end