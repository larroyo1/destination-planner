require 'rails_helper'

RSpec.describe 'destination show page' do
  it 'visits page' do
    destination = Destination.create!(name: 'denver',
                                      zip: '80249',
                                      description: 'a city in colorado',
                                      image_url: 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/11/denver-skyline-cold-snow-colorado-2.jpg?w=1500')

    visit destination_path(destination)

    expect(current_path).to eq("/destinations/#{destination.id}")
  end

  it 'has the correct content' do
    destination = Destination.create!(name: 'denver',
                                      zip: '80249',
                                      description: 'a city in colorado',
                                      image_url: 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/11/denver-skyline-cold-snow-colorado-2.jpg?w=1500')

    weather = WeatherFacade.weather_info('denver')

    visit destination_path(destination)

    expect(page).to have_content(weather.high_temp_farenheit)
    expect(page).to have_content(weather.low_temp_farenheit)
    expect(page).to have_content(weather.current_temp_farenheit)
    expect(page).to have_content(weather.summary)
  end
end
