module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate

      @api_user

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

      protected

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          @api_user = User.find_by(auth_token: token)
        end
      end
    end
  end
end
