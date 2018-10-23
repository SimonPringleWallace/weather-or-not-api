# Weather or Not (API)

Weather or Not is a weather app that provides you with only the weather
information you need to keep yourself warm and dry.

Link to the client app:
[link to production client url](https://simonpringlewallace.github.io/weather-or-not-client/#/)

Link to the client repo:
[link to production client repo](https://github.com/SimonPringleWallace/weather-or-not-client)


## Technologies Used:
  - Ruby
  - Ruby on Rails
  - HTTParty
  - Dark Sky API


## Catalog of Routes:

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/`    | `users#changepw`  |
| DELETE | `/sign-out/`           | `users#signout`   |
| DELETE | `/delete-account`      | `users#destroy`   |


### Forecasts

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/forecast/:city`     | `forecast#index`    |

### Locations

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/locations`           | `locations#index`    |
| POST   | `/locations`           | `locations#create`   |
| PATCH  | `/locations/:id`       | `locations#update`   |
| DELETE | `/locations/:id`       | `locations#destroy`  |



# Planning and Development process:
The process for creating the API for Weather or Not revolved around Dark Sky API.
Without this crucial component and the information it provided, the app itself
was useless and so, much of the effort of creating the system was expended on
trying to sync up this API with Dark Sky's. This was largely achieved through
HTTParty, a process that involved instantiating new classes with the HTTParty
methods and also a geo-coding gem to take in a city from the front end of the
system, and turn it into the longitude and latitude required by Dark Sky.

As well intentioned as planning was at the begining of the process, the learning
curve involved with using Dark Sky, a geocoder and HTTParty meant that there
was a good deal of not knowing what I didn't know going into the process and so
certian properties of resourses ended up being extraneous for the time-being
(longitude and latitude on the locations resource).

# Let's Connect
One of the greatest challenges in building out Weather or Not's API was
connecting with the Dark Sky API. While this integration was originally
planned for the front end of the system, after recieving a secret key to the
Dark Sky API, it immediatley became clear that integration would have to take
place on the back end, in order to keep that key safe.

Create routes within a Rails API to access and alter resources that I had create
was second nature, creating a route that would seek information outside of my
system was something I had never done before. How then to use a Ruby controller
to gain access to resources outside of my own?

The answer lay in HTTParty and in weilding the power of Ruby classes to create
the tool that I needed for myself. This was accomplised by creating a new Ruby
class and creating methods within that class to handle my Dark Sky API calls as
well as the conversion of 'city' and 'state' strings into the longitude and
latitude necessary for Dark Sky to return a weather report.

```
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
```

From my controller I was then able to create a new instance of this class and
call the necessary methods (weather_data) and (weather) in order to get the
information needed from Dark Sky.

```class ForecastController < OpenReadController
  def index
    @weather = Forecast.new(params[:city]).weather
    render json: @weather
  end
```
Rails is an incredible tool, but this experience opened my eyes to how much
I had been relying on it for constructing the flow of information within my API
and how much potenial there is for customization within a Rails API outside of
the framework that Rails provides. Having just scratched the surface I'm really
looking foward to building out more of these classes in the future.

# Future Work
This will extend largely around DRYing out the code that I have and taking a
hard look at the information I am currenly working with in the database to make
sure that all of it is necessary.

Link to Entity Relationship Diagram [ERD](./public/WON_ERD.png)

# Installation
- to access the code for this application please fork and clone this Repository or download the files.
- From the command line run:
- ```bundle install``` to install all dependencies
- ```bin/rails db:create``` to create the database
- ```bin/rails db:migrate``` synchronize migrations
- ```bin/rails s``` to host the server locally
