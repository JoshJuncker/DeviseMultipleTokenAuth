class DeviseMultipleTokenAuth::DeviceUpdateController < ApplicationController

  before_filter :authenticate_token_user!

  respond_to :json

  def update_push_token
    if @device.update(push_token_params)
      DeviseMultipleTokenAuth::Device.cleanup_push_tokens(@device.push_token, @device)
      render json: @device
    else
      render json: {error: "Unable to update the device with those params"}, status: :unprocessable_entity
    end
  end

  private
  def push_token_params
    params.permit(:push_token, :platform)
  end
end
