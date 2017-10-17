class FlossesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:brand] || params[:type]
      @flosses = Floss.by_brand_and_type(params[:brand], params[:type])
    else
      @flosses = Floss.by_brand_and_type("DMC", "Stranded Cotton")
    end
    @flosses = @flosses.sort { |a, b| a.flossnumber.to_i <=> b.flossnumber.to_i }
    if params[:sort_param] == "colour"
      @flosses = @flosses.order(colour: :asc)
    elsif params[:sort_param] == "number"
      @flosses = @flosses.sort { |a, b| a.flossnumber.to_i <=> b.flossnumber.to_i }
    end 
  end

  def increase
    user_floss = UserFloss.find(params[:user_floss][:user_floss_id])
    user_floss.increase(user_floss)
    flash[:notice] = 'Quantity successfully updated!'
    redirect_to :back
  end

  def decrease
    user_floss = UserFloss.find(params[:user_floss][:user_floss_id])
    user_floss.decrease(user_floss)
    redirect_to :back
  end
end

