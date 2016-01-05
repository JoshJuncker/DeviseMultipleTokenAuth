class DeviseMultipleTokenAuth::Device < ActiveRecord::Base
  belongs_to :user

  scope :expired, -> {where("expires_at < ?",Time.now)}
  scope :with_push_tokens, -> {where("push_token IS NOT NULL")}

  def self.destroy_expired
    DeviseMultipleTokenAuth::Device.expired.destroy_all
  end

  def self.cleanup_push_tokens!(token,omit_device)
    Device.where.not(id:omit_device.id).where(push_token:token).each do |other_device|
      other_device.push_token = nil
      other_device.save
    end
  end

  def expired?
    expires_at < Time.now
  end
end
