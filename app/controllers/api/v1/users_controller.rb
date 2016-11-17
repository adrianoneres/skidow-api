module Api
  module V1
    class UsersController < ApplicationController
      protect_from_forgery except: :create

      before_action :authenticate

      def show
        id = params[:id]
        email = params[:email]
        if id
          @user = User.find(id)
          render json: @user, status: 200
        elsif email
          @user = User.find_by(email: email)
          if @user
            render json: @user, status: 200
          else
            render json: { message: "No user found with the email '#{email}'." }, status: 404
          end
        else
          render json: { error: 'You have to inform an user email.' }, status: 400
        end
      end

      def create
        user = User.new(user_params)
        user.account = Account.new

        if user.save!
          render json: user, status: 201
        else
          render json: { message: 'Error saving transaction.' }, status: 400
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password)
      end

    end
  end
end
