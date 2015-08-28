require "devise_multiple_token_auth/engine"

module DeviseMultipleTokenAuth
  mattr_accessor :user_class
  mattr_accessor :device_expires_in_days
end
