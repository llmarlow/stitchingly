class FlossesController < ApplicationController
  def index
    @flosses = Floss.by_brand_and_type(params[:brand], params[:type])
    @flosses = @flosses.paginate(:page => params[:page], :per_page => 60)
  end
end
