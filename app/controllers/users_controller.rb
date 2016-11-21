class UsersController < ApplicationController
  def new
    if current_user
      redirect_to root_url, notice: 'Already signed in.'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    @user.account = Account.new
    if @user.save
      redirect_to log_in_path, notice: 'Signed up, now sign in to access your account!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
