module IRail
  module API
    SUPPORTED_APIS = {
      :nmbs => "NMBS",
      :sncb => "NMBS"
    }

    def self.new(provider = :nmbs)
      klass = api_name_for_provider(provider)
      const_get(klass).new
    end

    def self.api_name_for_provider(provider)
      SUPPORTED_APIS[provider]
    end
  end
end