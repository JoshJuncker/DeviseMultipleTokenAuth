module DeviseMultipleTokenAuth
  module ActiveRecord
    module Base

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def devise_token_authenticatable
          class_eval do
            has_many :devices, class_name: "DeviseMultipleTokenAuth::Device", dependent: :destroy
            def create_device
              DeviseMultipleTokenAuth::Device.destroy_expired
              new_device = Device.new
              new_device.user = self
              new_device.auth_token = SecureRandom.hex
              new_device.expires_at = (DeviseMultipleTokenAuth.device_expires_in_days || 14).days.from_now
              new_device.save!
              return new_device
            end
          end
        end
      end


    end
  end
end

class ActiveRecord::Base
  include DeviseMultipleTokenAuth::ActiveRecord::Base
end
