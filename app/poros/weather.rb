class Weather
  attr_reader :summary

  def initialize(data)
    @current_temperature = data[:main][:temp]
    @high_temperature = data[:main][:temp_max]
    @low_temperature = data[:main][:temp_min]
    @summary = data[:weather][0][:description]
  end

  def high_temp_farenheit
    temp = (@high_temperature - 273.15) * 1.8 + 32
    temp.round
  end

  def low_temp_farenheit
    temp = (@low_temperature - 273.15) * 1.8 + 32
    temp.round
  end

  def current_temp_farenheit
    temp = (@current_temperature - 273.15) * 1.8 + 32
    temp.round
  end

  def date
    Time.now.strftime("%a, %b %e")
  end
end
