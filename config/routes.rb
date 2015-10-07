Rails.application.routes.draw do
  namespace :devise_multiple_token_auth do
    post "auth/login", to: "token_authentication#login", defaults: { format: 'json'}
    delete "auth/logout", to: "token_authentication#logout", defaults: { format: 'json'}
    # put "update_push_token", to: "device_update_controller#update_push_token", defaults: { format: 'json'}
  end
end
