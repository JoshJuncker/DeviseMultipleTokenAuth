class DeviseMultipleTokenAuth::Device < ActiveRecord::Base
  belongs_to :user

  scope :expired, -> {where("expires_at < ?",Time.now)}
  scope :with_push_tokens, -> {where("push_token IS NOT NULL")}

  def self.destroy_expired
    DeviseMultipleTokenAuth::Device.expired.destroy_all
  end
  
  def expired?
    expires_at < Time.now
  end
end

