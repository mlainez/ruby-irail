require "roxml"

module IRail::NMBS
  class Platform
    include ROXML

    xml_accessor :number,  :from => :content
    xml_accessor :normal?, :from => "@normal"
  end
end