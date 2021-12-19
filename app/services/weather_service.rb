class WeatherService

  def self.get_weather(query)
    response = conn(query).get do |faraday|
      faraday.params['q'] = query
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn(url)
    Faraday.new("https://api.openweathermap.org/data/2.5/weather?q=#{url}") do |faraday|
      faraday.params['appid'] = ENV['weather_key']
    end
  end
end
