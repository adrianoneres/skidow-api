module Api
  module V1
    class TransactionsController < ApplicationController
      protect_from_forgery except: :create

      before_action :authenticate

      def create
        email = params[:transaction][:email]
        user = User.find_by(email: email)
        if email && user
          transaction = Transaction.new(transaction_params)
          transaction.account = user.account
          transaction.sender_id = @api_user.id
          unless transaction.source
            transaction.source = '[Skidow-API] ' + transaction.source
          end
          if transaction.save!
            render json: transaction, status: 201
          else
            render json: { message: 'Error saving transaction.' }, status: 400
          end
        else
          if email == nil
            render json: { error: 'You have to inform an user email.' }, status: 400
          elsif user == nil
            render json: { error: "No user found with the email '#{email}'." }, status: 404
          end
        end
      end

      private

      def transaction_params
        params.require(:transaction).permit(:value, :source, :description)
      end
    end
  end
end
