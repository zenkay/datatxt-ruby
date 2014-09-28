require "faraday"
require "faraday_middleware"
require "json"

module Datatxt

  class Base

    protected

    def call(endpoint, params)
      begin
        params = params.merge(
          :$app_id => Datatxt.config.app_id,
          :$app_key => Datatxt.config.app_key
        )
        conn = Faraday.new(url: Datatxt.config.endpoint) do |faraday|
          faraday.request  :url_encoded
          faraday.adapter  Faraday.default_adapter
        end
        response = conn.post endpoint, params
        JSON.parse response.body
      rescue Exception => e
        raise Datatxt::BadResponse
      end
    end

  end

end