module DeviseMultipleTokenAuth
  module ActionController
    module API
      def authenticate_token_user!
        token = request.env['HTTP_AUTHORIZATION']
        if token.present? && token.include?("OAuth")
          token = token.gsub(/^OAuth\s+/, '')
        end
        @device = Device.includes(:user).find_by_auth_token(token)
        if !@device || @device.expired? || @device.user == nil
          head :unauthorized
        else
          @device.expires_at = Time.now + (DeviseMultipleTokenAuth.device_expires_in_days || 14).days
          @device.save
          sign_in(@device.user)
          @current_user = @device.user
        end
      end
    end
  end
end

class ActionController::API
  include DeviseMultipleTokenAuth::ActionController::API
end