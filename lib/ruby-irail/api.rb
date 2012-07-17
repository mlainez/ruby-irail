module IRail
  module API
    SUPPORTED_APIS = {
      :nmbs => "NMBS",
      :sncb => "NMBS"
    }

    def self.new(provider = :nmbs)
      eval("IRail::#{api_name_for_provider(provider)}::API").new
    end

    def self.api_name_for_provider(provider)
      SUPPORTED_APIS[provider]
    end
  end
end