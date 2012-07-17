require "httparty"
require "nokogiri"

Dir.glob(File.join(File.dirname(__FILE__), "**", "*.rb")).each{ |file| require file }