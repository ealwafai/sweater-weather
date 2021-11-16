class RoadtripService
  class << self
    def conn
      Faraday.new('https://www.mapquestapi.com') do |f|
        f.params['key'] = ENV['mapquest_key']
      end
    end

    def get_roadtrip(origin, destination)
      response = conn.get('/directions/v2/route') do |req|
        req.params['from'] = origin
        req.params['to'] = destination
        req.params['ambiguities'] = 'ignore'
        req.params['outFormat'] = 'json'
        req.params['routeType'] = 'fastest'
        req.params['avoidTimedConditions'] = false
        req.params['doReverseGeocode'] = false
        req.params['enhancedNarrative'] = false
      end

      JSON.parse(response.body, symbolize_names: true)
    end

  end
end
