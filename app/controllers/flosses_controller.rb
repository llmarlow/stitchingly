class FlossesController < ApplicationController
  def index
    @flosses = Floss.paginate(:page => params[:page], :per_page => 60)
  end
end
