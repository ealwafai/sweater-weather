class BackgroundService
  class << self
    def conn
      Faraday.new('https://api.unsplash.com') do |f|
        f.headers['Accept-Version'] = 'v1'
        f.headers['Authorization'] = ENV['unsplash_key']
      end
    end

    def get_background(location)
      response = conn.get('/search/photos') do |f|
        f.params['query'] = location
        f.params['page'] = 1
        f.params['per_page'] = 1
        f.params['content_filter'] = 'high'
        f.params['orientation'] = 'landscape'
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
