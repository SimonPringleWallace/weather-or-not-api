# frozen_string_literal: true

class ForecastSerializer < ActiveModel::Serializer
  attributes :id, :text, :editable

  def editable
    scope == object.user
  end
end
