require "roxml"
require_relative "./step.rb"
require_relative "./trip.rb"

module IRail::NMBS
  class Connection
    include ROXML

    xml_accessor :id,        :from => "@id", :as => Integer
    xml_accessor :departure, :as   => Step, :from => "departure"
    xml_accessor :trip,      :as   => Trip
  end
end