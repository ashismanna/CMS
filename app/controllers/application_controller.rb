class ApplicationController < ActionController::Base
		before_action :authenticate_user!
	protect_from_forgery with: :exception


	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :fullname, :password, :password_confirmation])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
	end

	def after_sign_in_path_for(resource)
    	stored_location_for(resource) || landing_upon_sign_in
  	end

  	def landing_upon_sign_in
    	"/"
  	end


  	private
	def after_sign_out_path_for(resource)
		stored_location_for(:user) || root_path
	end
end
