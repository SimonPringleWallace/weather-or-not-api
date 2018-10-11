# frozen_string_literal: true

require 'httparty'
require 'geocoder'

class Forecast
  include HTTParty
  include Geocoder
  # base_uri 'https://api.darksky.net/forecast'


  def initialize(city)
    geocode = Geocoder.search(city).first.coordinates
    @latitude = geocode[0]
    @longitude = geocode[1]
    @DS_key = ENV['DARK_SKY_KEY']
  end

  def weather_data
    puts "this is the base uri #{Forecast.base_uri}"
    self.class.get(
      "https://api.darksky.net/forecast/#{@DS_key}/#{@latitude},#{@longitude}?exclude=currently,minutely,hourly,alerts,flags")
  end

  def weather
    weather_data.parsed_response
  end
end
