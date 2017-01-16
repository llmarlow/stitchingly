class FlossesController < ApplicationController
  def index
    @flosses = Floss.all
  end
end
