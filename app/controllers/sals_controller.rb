class SalsController < ApplicationController
  def index
    @sals = Sal.all
  end

  def show
    @sal = Sal.find(params[:id])
    @projects = @sal.tag.projects
    @releases = @sal.releases
    @releases = @releases.paginate(:page => params[:page], :per_page => 12)
  end

  def new
    @sal = Sal.new
  end

  def create
    @sal = Sal.new(sal_params)
    respond_to do |format|
      if @sal.save
        format.html { redirect_to sals_path, notice: 'Sal was successfully created.' }
        format.json { render :show, status: :created, location: @sal }
      else
        format.html { render :new }
        format.json { render json: @sal.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @sal = Sal.find(params[:id])
  end

  def update
    @sal = Sal.find(params[:id])
    respond_to do |format|
      if @sal.update(sal_params)
        format.html { redirect_to sals_path, notice: 'Sal was successfully updated.' }
        format.json { render :show, status: :ok, location: @sal }
      else
        format.html { render :edit }
        format.json { render json: @sal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @sal = Sal.find(params[:id])
    @sal.destroy
    respond_to do |format|
      format.html { redirect_to sals_path, notice: 'Sal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def sal_params
      params.require(:sal).permit(:name, :company, :picture, :start_date, :end_date, :notes, :link, :tag_id)
    end

end
