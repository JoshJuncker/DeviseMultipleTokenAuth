module DeviseMultipleTokenAuth
  module ActiveRecord
    module Base

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def devise_token_authenticable
          class_eval do 
            has_many :devices, class_name: "DeviseMultipleTokenAuth::Device"
            def create_device
              new_device = Device.new
              new_device.user self
              new_device.auth_token = SecureRandom.hex
              new_device.expires_at = DeviseMultipleTokenAuth.device_expires_in_days.days.from_now
              new_device.save!
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