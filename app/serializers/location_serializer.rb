class LocationSerializer < ActiveModel::Serializer
  attributes :id, :city, :state, :longitude, :latitude
end
