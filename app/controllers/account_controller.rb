class AccountController < ApplicationController
  before_action :verify_logged_in

  def index
    @transactions = Transaction.where(account_id: current_user.account.id).paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end
end
