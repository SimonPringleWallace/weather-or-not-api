# frozen_string_literal: true

class ForecastController < OpenReadController
  def index
    @weather = Forecast.new(coordinates[:longitude], coordinates[:latitude]).weather
    render json: @weather
  end

  def coordinates
    params.require(:forecasts).permit(:longitude, :latitude)
  end
end
