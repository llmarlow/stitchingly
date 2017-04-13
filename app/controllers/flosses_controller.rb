class FlossesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @flosses = Floss.by_brand_and_type(params[:brand], params[:type])
    @q = @flosses.ransack(params[:q])
    @flosses = @q.result.paginate(:page => params[:page], :per_page => 60) 
  end

  def increase
    user_floss = UserFloss.find(params[:user_floss][:user_floss_id])
    user_floss.increase(user_floss)
    redirect_to flosses_path
  end

  def decrease
    user_floss = UserFloss.find(params[:user_floss][:user_floss_id])
    user_floss.decrease(user_floss)
    redirect_to flosses_path
  end
end
