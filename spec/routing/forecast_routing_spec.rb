require "rails_helper"

RSpec.describe ForecastController, type: :routing do
    it "routes to #index" do
      expect(:get => '/forecast').to route_to("forecast#index")
    end
  end
