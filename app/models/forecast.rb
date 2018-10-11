# frozen_string_literal: true

require 'httparty'
require 'geocoder'

class Forecast
  include HTTParty
  include Geocoder
  base_uri 'api.darksky.net'
  DARKSKYKEY = ENV['DARK_SKY_KEY']

  def initialize(city)
    geocode = Geocoder.search(city).first.coordinates
    @latitude = geocode[0]
    @longitude = geocode[1]
  end

  def weather_data
    self.class.get(
      "/forecast/#{DARKSKYKEY}/#{@latitude},#{@longitude}?exclude=[currently,minutely,hourly,alerts,flags]")
  end

  def weather
    weather_data.parsed_response
  end
end
