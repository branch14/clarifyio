module Clarifyio
  class Bundle < Struct.new(:data)

    class << self
      def all
        Endpoint.instance.bundles['_links']['items'].map do |i|
          new({'_links' => {'self' => i}})
        end
      end
    end

    def href
      data['_links']['self']['href']
    end
    
    def load
      self.data = Endpoint.instance.get(href)
      self
    end

    def tracks
      url = data['_links']['o3v:tracks']['href']
      Endpoint.instance.get(url)['tracks'].map do |t|
        Track.new(t)
      end
    end
    
  end
end
