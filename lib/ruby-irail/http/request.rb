module IRail
  module Request
    def self.get(url, options = {})
      request = HTTParty.get(url, options)
      request.response.body
    end
  end
end