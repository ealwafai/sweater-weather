class BackgroundFacade
  def self.get_background(location)
    background = BackgroundService.get_background(location)

    Background.new(background[:results].first)
  end
end
