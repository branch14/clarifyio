module Clarifyio
  class Exec < Struct.new(:args)
    class << self
      def run(args)
        new(args).run
      end
    end

    def run
      command = args[0]
      return usage unless respond_to?(command)
      send(command)
    end

    def index
      url = args[1] || usage
      bundle = Endpoint.instance.create_bundle(media_url: url)
      puts bundle.to_yaml
    end

    def bundles
      puts Endpoint.instance.bundles.to_yaml
    end

    def tree
      puts
      Bundle.all.each do |bundle|
        puts bundle.load.href
        bundle.tracks.each do |track|
          puts "  #{track.media_url} (#{track.status})"
        end
      end
      puts
    end

    def search
      query = args[1] || usage
      results = Endpoint.instance.search(query)
      puts results.to_yaml
    end
    
    def usage
      puts
      puts 'Usage: clarifyio index <url>'
      puts '                 bundles'
      puts '                 tree'
      puts '                 search <query>'
      puts
      exit
    end
  end
end
