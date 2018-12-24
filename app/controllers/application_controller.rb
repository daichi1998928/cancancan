class ApplicationController < ActionController::Base

   def authenticate_admin
    if current_user.admin_flg != true
      redirect_to posts_path
      return
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to posts_path, :alert => exception.message
  end

end
