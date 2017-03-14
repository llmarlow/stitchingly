class TagsController < ApplicationController
  def index
    @tags = Tag.joins(:projects).distinct.order(:name)
  end
  def show
    @tag = Tag.find(params[:id])
  end
end
