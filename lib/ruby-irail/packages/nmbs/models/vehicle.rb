module IRail::NMBS
  class Vehicle
    include ROXML

    xml_accessor :id, :from => :content
  end
end