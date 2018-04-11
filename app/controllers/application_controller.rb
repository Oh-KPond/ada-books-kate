class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_user
    @user = User.find_by(id: session[:user_id])
  end
end
