# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ForecastController do
  before (:all) do
    @key = ENV['DARK_SKY_KEY']
    @latitude = '42.3601'
    @longitude = '-71.0589'
  end

  describe 'GET #index' do
    it 'returns the weather' do
      get :index
      expect(response).to be_success
    end
  end
end
