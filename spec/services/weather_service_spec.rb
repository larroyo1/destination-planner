require 'rails_helper'

RSpec.describe WeatherService do
  it 'establishes successful connection' do
    weather = WeatherService.get_weather('denver')

    expect(weather).to be_a(Hash)
    expect(weather[:name]).to eq('Denver')
  end
end
