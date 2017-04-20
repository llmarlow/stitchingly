class ReleasesController < ApplicationController
  before_action :set_sal
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @release = Release.new
  end

  def create
    @release = @sal.releases.new(release_params)
    respond_to do |format|
      if @release.save
        format.html { redirect_to sal_path(@sal), notice: 'Release was successfully created.' }
        format.json { render :show, status: :created, location: @release }
      else
        format.html { render :new }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @release = @sal.releases.find(params[:id])
  end

  def update
    @release = @sal.releases.find(params[:id])
    respond_to do |format|
      if @release.update(release_params)
        format.html { redirect_to sal_path(@sal), notice: 'Release was successfully updated.' }
        format.json { render :show, status: :ok, location: @sal }
      else
        format.html { render :edit }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @release = @sal.releases.find(params[:id])
    @release.destroy
    respond_to do |format|
      format.html { redirect_to sal_path(@sal), notice: 'Release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sal
      @sal = Sal.find(params[:sal_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_params
      params.require(:release).permit(:picture, :name)
    end
end
