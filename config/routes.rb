Rails.application.routes.draw do
  namespace :devise_multiple_token_auth do
    post "auth/login", to: "token_authentication#login", defaults: { format: 'json'}
    delete "auth/logout", to: "token_authentication#logout", defaults: { format: 'json'}
  end
end
