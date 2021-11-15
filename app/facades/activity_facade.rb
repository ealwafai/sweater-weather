class ActivityFacade
  def self.get_activity(type)
    activity = ActivityService.get_activity(type)

    Activity.new(activity)
  end
end
