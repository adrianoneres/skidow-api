class PlansController < ApplicationController
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  before_action :verify_logged_in, except: [:price]

  def index
    @plans = Plan.where(user_id: current_user.id).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_attributes)
    @plan.user = current_user
    if current_user.account.total_balance < @plan.total_price
      render :new, error: 'Insuficiente'
    elsif @plan.banner.blank?
      render :new, error: 'Branco'
    elsif @plan.save!
      redirect_to plans_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def price
    plan = Plan.new(period: params[:period], land: params[:land])
    render json: { price: plan.total_price }
  end

  private

  def plan_attributes
    params.require(:plan).permit(:age, :gender, :land, :period, :banner)
  end

end
