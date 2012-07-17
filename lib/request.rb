module IRail
  module Request
    raise "pouetpouetpouet"

    def self.get(url)
      request = HTTParty.get(url)
      request.response.body
    end
  end
end