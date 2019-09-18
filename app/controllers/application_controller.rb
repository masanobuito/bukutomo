class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
  protected
#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#     devise_parameter_sanitizer.permit(:account_update,keys: [:name] )
#   end

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

    private

    def after_sign_up_path_for(resource)
        if current_user
            users_show_path
        elsif current_admin
            admins_admins_show_path
        else
            root_path
        end
    end


    def after_sign_in_path_for(resource)
        if current_user
            users_show_path
        elsif current_admin
            admins_admins_show_path
        else
            root_path
        end
    end


end