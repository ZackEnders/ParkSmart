class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #### DEVISE ####

  #To permit additional devise params
  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private



  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path ||  stored_location_for(resource_or_scope)
  end
   # Overwriting the sign_up redirect path method
  def after_sign_up_path_for(resource_or_scope)
    redirect_to user_profile_path(:username => current_user.username)
  end

  def after_update_path_for(resource)
    redirect_to user_profile_path(:username => current_user.username)
  end

  protected

	#Permitting specific params for devise
	def configure_permitted_parameters
 		devise_parameter_sanitizer.permit(:sign_up, keys: [:fName, :lName, :date_of_birth, :username, :email, :password, :password_confirmation])
 		devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
 		devise_parameter_sanitizer.permit(:account_update, keys: [:fName, :lName, :date_of_birth, :location, :gender, :phoneNumber, :description, :username, :email, :password, :password_confirmation, :current_password])
	end
end
