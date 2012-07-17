module IRail
  class Request
    def self.get(url)
      request = HTTParty.get(url)
      request.response.body
    end
  end
end