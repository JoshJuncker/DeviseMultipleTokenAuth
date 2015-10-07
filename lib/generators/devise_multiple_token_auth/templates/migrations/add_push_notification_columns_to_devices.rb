class AddPushNotificationColumnsToDevices < ActiveRecord::Migration
  def change
    add_column :devise_multiple_token_auth_devices, :platform, :string
    add_column :devise_multiple_token_auth_devices, :push_token, :string
  end
end
