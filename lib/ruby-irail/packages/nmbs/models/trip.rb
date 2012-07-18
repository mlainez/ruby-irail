require "roxml"
require_relative "./stopover.rb"

module IRail::NMBS
  class Trip
    include ROXML

    xml_name 'vias'

    xml_accessor :stopover_count, :from => "@number", :as => Integer
    xml_accessor :stopovers,      :as   => [Stopover]
  end
end