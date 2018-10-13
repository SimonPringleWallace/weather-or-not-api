# frozen_string_literal: true

class ForecastController < OpenReadController
  def index
    @weather = Forecast.new(params[:city]).weather
    render json: @weather
  end
end
