class CreateDeviseMultipleTokenAuthDevices < ActiveRecord::Migration
  def change
    create_table :devise_multiple_token_auth_devices do |t|
      t.belongs_to :user, index: true
      t.string :auth_token, null:false, index: {unique: true}
      t.datetime :expires_at
      t.timestamps null: false
    end
  end
end
