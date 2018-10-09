class ForecastController < OpenReadController
  def index
    @weather = Forecast.new.weather
    render json: @weather
  end
end
