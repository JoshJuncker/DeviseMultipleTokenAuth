class AddPushNotificationFieldsToDevices < ActiveRecord::Migration
  def change
    add_column :devise_multiple_token_auth_devices, :platform, :string
    add_column :devise_multiple_token_auth_devices, :push_token, :string
    add_column :devise_multiple_token_auth_devices, :expires_at, :datetime
  end
end
