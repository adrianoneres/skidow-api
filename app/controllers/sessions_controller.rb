class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_url, notice: 'Already signed in.'
    end
  end

  def create
    user = User.login(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
