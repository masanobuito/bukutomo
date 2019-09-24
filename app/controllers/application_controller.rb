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
            admins_posts_path
        else
            root_path
        end
    end


    def after_sign_in_path_for(resource)
        if current_user
            users_show_path
        elsif current_admin
            admins_posts_path
        else
            root_path
        end
    end

    def user_signed_in
		if user_signed_in?
			flash[:notice] = "ユーザーでログインしています。一度ログアウトしてください"
			redirect_to session[:return_to]
		end
	end
	def admin_signed_in
		if admin_signed_in?
			flash[:notice] = "管理者でログインしています。一度ログアウトしてください"
			redirect_to session[:return_to]
		end
    end

    def store_location
		session[:return_to] = request.url
	end
    


end