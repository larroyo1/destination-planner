class WeatherFacade
  def self.weather_info(query)
    weather = WeatherService.get_weather(query)

    Weather.new(weather)
  end
end
