class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "まずはログインするにょ"
      redirect_to login_url
    end
  end

  def admin_user
    unless current_user.admin?
      flash[:danger] = "何をするにょ！ 勝手にそんなことをしてはだめだにょ！ "
      redirect_to root_url
    end
  end
end
