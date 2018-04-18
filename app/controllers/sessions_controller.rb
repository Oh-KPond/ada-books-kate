class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash[:uid]
      @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
      if @user.nil?
        # User doesn't match anything in the DB
        # Attempt to create a new user
        @user = User.build_from_github(auth_hash)
      else
        flash[:success] = "Logged in successfully"
        redirect_to root_path
      end

      # If we get here, we have the user instance
      session[:user_id] = @user.id
    else
      flash[:error] = "Could not log in"
      redirect_to root_path
    end
    # @user = User.find_by name: params[:user][:name]
    #
    # if @user
    #   session[:user_id] = @user.id
    #   # session[:user_name] = @user.name
    #   flash[:success] = "Welcome back #{@user.name}"
    # else
    #   @user = User.create name: params[:user][:name]
    #   session[:user_id] = @user.id
    #   flash[:success] = "Welcome #{@user.name}"
    # end
    # redirect_to root_path
  end

  def index
    @user = User.find(session[:user_id]) # < recalls the value set in a previous request
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
        flash[:success] = "Successfully logged out!"

        redirect_to root_path
    # session[:user_id] = nil
    # flash[:success] = "You logged out!"
    # redirect_to root_path
  end
end
