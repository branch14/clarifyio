require 'singleton'
require 'yaml'
require 'ostruct'
require 'faraday'
require 'json'

module Clarifyio
  class Endpoint
    include Singleton
    
    ENDPOINT = 'https://api-beta.op3nvoice.com:443'
    
    attr_accessor :config, :connection

    def initialize
      yaml_config = File.read(File.expand_path("~/.clarifyio"))
      self.config = OpenStruct.new(YAML.load(yaml_config))

      self.connection = Faraday.new(url: ENDPOINT) do |f|
        f.headers['Authorization'] = "Bearer #{config.token}"
        f.adapter Faraday.default_adapter
      end
    end

    def bundles
      get('/v1/bundles')
    end

    def create_bundle(payload)
      post('/v1/bundles', URI.encode_www_form(payload))
    end

    def search(query)
      get('/v1/search', query: query)
    end
    
    def get(url, parameter={})
      JSON.parse(connection.get(url, parameter).body)
    end

    def post(url, parameters={})
      JSON.parse(connection.post(url, payload).body)
    end
  end
end
