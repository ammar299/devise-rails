class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token  
	before_action :configure_permitted_parameters, if: :devise_controller?
	

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:country, :city])
	end

	def user_params
		params.require(:user).permit(:avatar)
	end

	def send_devise_notification(notification, *args)
  	devise_mailer.send(notification, self, *args).deliver_now
	end

end
