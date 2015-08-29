class DeviseMultipleTokenAuth::Device < ActiveRecord::Base
  self.inheritance_column = :platform
  belongs_to :user

  scope :expired, -> {where("expires_at < ?",Time.now)}

  def self.destroy_expired
    DeviseMultipleTokenAuth::Device.expired.destroy_all
  end
  
  def expired?
    expires_at < Time.now
  end
end

