# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

module Mixins
  module NetBase
    def post_request(url, params)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.read_timeout = 300 # seconds
      http.use_ssl = (uri.scheme == 'https')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json', 'Accept' => 'application/json')
      req.body = params.to_json
      http.request(req)
    end
  end
end
