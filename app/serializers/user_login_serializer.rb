# frozen_string_literal: true

class UserLoginSerializer < ActiveModel::Serializer
  attributes :id, :email, :token

  def token
    Rails.application.message_verifier(:signed_token).generate(object.token)
  end
end

# can I access DARK_SKY_KEY with ENV test
# def dk_key
#   ENV['DARK_SKY_KEY']
# end
