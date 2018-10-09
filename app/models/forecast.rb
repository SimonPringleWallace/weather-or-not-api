# frozen_string_literal: true

require 'httparty'

class Forecast
  include HTTParty
  base_uri 'https://api.darksky.net/forecast'
  DARKSKYKEY = ENV['DARK_SKY_KEY']

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def weather_data
    self.class.get("/#{DARKSKYKEY}/#{@latitude},#{@longitude}")
  end

  def weather
    weather_data.parsed_response
  end
end
