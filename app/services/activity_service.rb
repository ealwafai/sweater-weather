class ActivityService
  class << self
    def conn
      Faraday.new('http://www.boredapi.com')
    end

    def get_activity(type)
      response = conn.get("/api/activity") do |req|
        req.params['type'] = type
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
