require "faraday"
require "faraday_middleware"
require "json"

module Datatxt

  class Nex

    attr_accessor :endpoint, :text, :url, :html, :html_fragment, :lang, :min_confidence, :min_length, :social_hashtag, :social_mention, :include, :extra_types, :country, :custom_spots

    def initialize
      
    end

    def post(options)
      call(params)
    end

    protected

    def call(params)
      begin
        params = params.merge({api_key: Machinereading.config.api_key})
        conn = Faraday.new(url: Machinereading.config.endpoint) do |faraday|
          faraday.request  :url_encoded
          faraday.adapter  Faraday.default_adapter
        end
        response = conn.post "/#{endpoint}", params
        response.body
      rescue Exception => e
        puts e.inspect
      end
    end


  end

end