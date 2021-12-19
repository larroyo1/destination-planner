require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'successfully creates weather poros' do
    weather = WeatherFacade.weather_info('denver')

    expect(weather).to be_a(Weather)
    expect(weather.summary).to eq('clear sky')
    expect(weather.current_temp_farenheit).to be_a(Integer)
  end
 end
