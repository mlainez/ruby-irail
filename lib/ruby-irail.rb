require "httparty"
require "nokogiri"

require File.join(File.dirname(__FILE__), 'ruby-irail', 'api')
require File.join(File.dirname(__FILE__), 'ruby-irail', 'http', 'request')
require File.join(File.dirname(__FILE__), 'ruby-irail', 'models', 'station')
require File.join(File.dirname(__FILE__), 'ruby-irail', 'parser', 'document_parser')
require File.join(File.dirname(__FILE__), 'ruby-irail', 'parser', 'station_parser')

module IRail
end