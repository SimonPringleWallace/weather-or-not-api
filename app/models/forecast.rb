require 'httparty'

class Forecast
  include HTTParty
  base_uri 'https://api.darksky.net/forecast'
  DARKSKYKEY = ENV['DARK_SKY_KEY']

  def get_data
    self.class.get("/#{DARKSKYKEY}/42.3601,-71.0589")
  end
  def weather
    get_data.parsed_response
  end
end
