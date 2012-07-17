require "roxml"

module IRail::NMBS
  class Station
    include ROXML

    xml_accessor :id,            :from => "@id"
    xml_accessor :latitude,      :from => "@locationY", :as => Float
    xml_accessor :longitude,     :from => "@locationX", :as => Float
    xml_accessor :standard_name, :from => "@standardname"
    xml_accessor :name,          :from => :content
  end
end