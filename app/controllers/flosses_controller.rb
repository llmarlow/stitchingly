class FlossesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @flosses = Floss.by_brand_and_type(params[:brand], params[:type])
    @q = @flosses.ransack(params[:q])
    @flosses = @q.result.paginate(:page => params[:page], :per_page => 60)
  end
end
