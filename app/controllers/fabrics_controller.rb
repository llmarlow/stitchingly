class FabricsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fabric, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  # GET /fabrics
  # GET /fabrics.json
  def index
    @q = @user.fabrics.ransack(params[:q])
    @fabrics = @q.result
    @fabrics = @q.result.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /fabrics/1
  # GET /fabrics/1.json


  # GET /fabrics/new
  def new
    @fabric = Fabric.new
  end

  # GET /fabrics/1/edit
  def edit
    @user.fabrics.find(params[:id])
  end

  # POST /fabrics
  # POST /fabrics.json
  def create
    @fabric = @user.fabrics.new(fabric_params)

    respond_to do |format|
      if @fabric.save
        format.html { redirect_to fabrics_path, notice: 'Fabric was successfully created.' }
        format.json { render :show, status: :created, location: @fabric }
      else
        format.html { render :new }
        format.json { render json: @fabric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fabrics/1
  # PATCH/PUT /fabrics/1.json
  def update
    @fabric = @user.fabrics.find(params[:id])
    respond_to do |format|
      if @fabric.update(fabric_params)
        format.html { redirect_to fabrics_path, notice: 'Fabric was successfully updated.' }
        format.json { render :show, status: :ok, location: @fabric }
      else
        format.html { render :edit }
        format.json { render json: @fabric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fabrics/1
  # DELETE /fabrics/1.json
  def destroy
    @fabric = @user.fabrics.find(params[:id])
    @fabric.destroy
    respond_to do |format|
      format.html { redirect_to fabrics_path, notice: 'Fabric was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fabric
      @fabric = Fabric.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fabric_params
      params.require(:fabric).permit(:user_id, :brand, :colour, :count, :height, :width, :fabric_type)
    end
end
