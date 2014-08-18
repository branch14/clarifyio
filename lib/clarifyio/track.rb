module Clarifyio
  class Track < Struct.new(:data)
    def media_url
      data['media_url']
    end

    def status
      data['status']
    end
  end
end
