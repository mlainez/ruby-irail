require "httparty"
require "nokogiri"
require "roxml"

Dir.glob(File.join(File.dirname(__FILE__), "**", "*.rb")).each{ |file| require file }