module DeviseMultipleTokenAuth
  module ActionController
    module Base
      def authenticate_token_user!
        token = request.env['HTTP_AUTHORIZATION']
        if token.present? && token.include?("OAuth")
          token = token.gsub(/^OAuth\s+/, '')
        end
        @device = Device.find_by_auth_token(token)
        if !@device || @device.expired? || @device.user == nil
          respond_to do |format|
            format.html { redirect_to new_user_session_path }
            format.json { render status: :unauthorized, nothing: true }
          end
        else
          @device.expires_at = Time.now + (DeviseMultipleTokenAuth.device_expires_in_days || 14).days
          @device.save
          sign_in(@device.user)
        end
      end
    end
  end
end

class ActionController::Base
  include DeviseMultipleTokenAuth::ActionController::Base
end