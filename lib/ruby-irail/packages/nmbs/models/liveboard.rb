require "roxml"

module IRail::NMBS
  class Liveboard
    include ROXML

    xml_name 'liveboard'

    xml_accessor :station,         :as   => Station
    xml_accessor :departures,      :from => "departures/departure", :as => [Step]
    xml_accessor :arrivals,        :from => "arrivals/arrival",     :as => [Step]
  end
end