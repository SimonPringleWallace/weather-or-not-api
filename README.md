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
HTTPary, a process that involved instantiating new classes with the HTTParty
methods and also a geo-coding gem to take in a city from the front end of the
system, and turn it into the longitude and latitude required by Dark Sky.

As well intentioned as planning was at the begining of the process, the learning
curve involved with using Dark Sky, a geocoder and HTTParty meant that there
was a good deal of not knowing what I didn't know going into the process and so
certian properties of resourses ended up being extraneous for the time-being
(longitude and latitude on the locations resource).

# Future Work
This will extend largely around DRYing out the code that I have and taking a
hard look at the information I am currenly working with in the database to make
sure that all of it is necessary.

Link to Entity Relationship Diagram [ERD](./public/Weather_or_Not_ERD.png)

# Installation
- to access the code for this application please fork and clone this Repository or download the files.
- From the command line run:
- ```bundle install``` to install all dependencies
- ```bin/rails db:create``` to create the database
- ```bin/rails db:migrate``` synchronize migrations
- ```bin/rails s``` to host the server locally
