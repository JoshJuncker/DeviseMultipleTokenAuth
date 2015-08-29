class DeviseMultipleTokenAuth::TokenAuthenticationController < ApplicationController

  before_filter :authenticate_token_user!
  skip_filter :authenticate_token_user!, only: [:login]

  respond_to :json
  def login
    email = params[:email] || params[:username]
    password = params[:password]
    user = User.find_by(email: email)
    if user.present? && user.valid_password?(params[:password])
      device = user.create_device
      render json: {auth_token: device.auth_token}, status: :ok
    else
      render json: {error: 'Invalid credentials', code: '401'}, status: :unauthorized
    end
  end

  def logout
    @device.destroy if @device
    head :no_content
  end

end