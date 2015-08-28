Rails.application.routes.draw do

  mount DeviseMultipleTokenAuth::Engine => "/devise_multiple_token_auth"
end
