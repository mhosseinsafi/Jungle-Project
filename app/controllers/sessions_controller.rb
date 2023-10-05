class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    # If the user exists AND the password entered is correct
    if @user&.authenticate(params[:password])
      # Saving the user id in cookie, for keeping logged in
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Logged in!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new