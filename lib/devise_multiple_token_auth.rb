require "devise_multiple_token_auth/engine"
require "devise_multiple_token_auth/active_record/base"
require "devise_multiple_token_auth/version"
require 'devise_multiple_token_auth/action_controller/base'
module DeviseMultipleTokenAuth
  mattr_accessor :user_class
  mattr_accessor :device_expires_in_days
end
