require 'rails_helper'

RSpec.describe "Dark Sky", type: :request do

before(:all) do
  @key = ENV['DARK_SKY_KEY']
  @latitude = '42.3601'
  @longitude = '-71.0589'
end

  describe 'GET /forecast' do
    it 'returns the weather' do
      get "/forecast/#{@key}/#{@latitude},#{@longitude}"
      expect(response).to have_http_status(200)
    end
  end
end
