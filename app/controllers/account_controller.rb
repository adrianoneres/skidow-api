class AccountController < ApplicationController
  before_action :verify_logged_in

  def index
    @transactions = Transaction.where(account_id: current_user.account.id).paginate(page: params[:page]).order(created_at: :desc)
  end
end
