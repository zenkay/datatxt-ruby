require "faraday"
require "faraday_middleware"
require "json"

module Datatxt

  class Nex < Base

    ENDPOINT = "/datatxt/nex/v1"

    attr_accessor :text, :url, :html, :html_fragment, :lang, :min_confidence, :min_length, :social_hashtag, :social_mention, :include, :extra_types, :country, :custom_spots

    def analyze(options)
      params = options
      call(ENDPOINT, params)
    end

  end

end