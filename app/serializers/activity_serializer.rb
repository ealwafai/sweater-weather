class ActivitySerializer
  def self.get_activity(location, forecast, activities)
    {
      data: {
        id: nil,
        type: 'activities',
        attributes: {
          destination: location,
          forecast: {
            summary: forecast.current.conditions,
            temperature: "#{forecast.current.temperature} F"
          },
          activities: activities.map do |activity|
                        {
                          title: activity.title,
                          type: activity.type,
                          participants: activity.participants,
                          price: activity.price
                        }
                      end
        }
      }
    }
  end
end
