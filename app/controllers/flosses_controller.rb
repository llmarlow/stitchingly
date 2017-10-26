class FlossesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:brand] || params[:type]
      @flosses = Floss.by_brand_and_type(params[:brand], params[:type])
    else
      @flosses = Floss.by_brand_and_type("DMC", "Stranded Cotton")
    end
    if params[:sort_param] == "colour"
      @flosses = @flosses.order(:colour)
    else
      @flosses = @flosses.sort { |a, b| a.flossnumber.to_i <=> b.flossnumber.to_i }
    end 
  end

  def increase
    user_floss = UserFloss.find(params[:user_floss][:user_floss_id])
    user_floss.increase(user_floss)
    flash[:notice] = 'Quantity successfully updated!'
    redirect_to :back
  end

  def increase_with_jquery
    @floss_id = params[:id]
    @floss = Floss.find_by_id(@floss_id)
    user_floss = UserFloss.get_userfloss_by_user_and_floss(current_user, @floss)
    @quantity = 1
    if user_floss != nil then 
      user_floss.increase(user_floss)
      @quantity = user_floss.floss_quantity
    else
      user_floss = UserFloss.new
      user_floss.floss_id = @floss_id
      user_floss.floss_quantity = 1
      user_floss.user_id = current_user.id
      user_floss.save
    end
    render :layout => false
  end

  def decrease
    user_floss = UserFloss.find(params[:user_floss][:user_floss_id])
    user_floss.decrease(user_floss)
    redirect_to :back
  end

  def decrease_with_jquery
    @floss_id = params[:id]
    @floss = Floss.find_by_id(@floss_id)
    user_floss = UserFloss.get_userfloss_by_user_and_floss(current_user, @floss)
    @quantity = 0    
    if user_floss != nil then 
      user_floss.decrease(user_floss)
      @quantity = user_floss.floss_quantity
    else
      user_floss = UserFloss.new
      user_floss.floss_id = @floss_id
      user_floss.floss_quantity = 0
      user_floss.user_id = current_user.id
      user_floss.save
    end
    render :layout => false
  end
end

