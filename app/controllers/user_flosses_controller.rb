class UserFlossesController < ApplicationController
  before_action :set_user_floss, only: [:show, :edit, :update, :destroy]

  # GET /user_flosses
  # GET /user_flosses.json
  def index
    @user_flosses = UserFloss.all
  end

  # GET /user_flosses/1
  # GET /user_flosses/1.json
  def show
  end

  # GET /user_flosses/new
  def new
    @user_floss = UserFloss.new
  end

  # GET /user_flosses/1/edit
  def edit
  end

  # POST /user_flosses
  # POST /user_flosses.json
  def create
    @user_floss = UserFloss.new(user_floss_params)
    respond_to do |format|
      if @user_floss.save
        format.html { redirect_to flosses_path, notice: 'User floss was successfully created.' }
        format.json { render :show, status: :created, location: @user_floss }
      else
        format.html { render :new }
        format.json { render json: @user_floss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_flosses/1
  # PATCH/PUT /user_flosses/1.json
  def update
    respond_to do |format|
      if @user_floss.update(user_floss_params)
        format.html { redirect_to flosses_path, notice: 'Quantity was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_floss }
      else
        format.html { redirect_to flosses_path, alert: 'Quantity was not successfully updated.' }
        format.json { render json: @user_floss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_flosses/1
  # DELETE /user_flosses/1.json
  def destroy
    @user_floss.destroy
    respond_to do |format|
      format.html { redirect_to user_flosses_url, notice: 'User floss was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_floss
      @user_floss = UserFloss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_floss_params
      params.require(:user_floss).permit(:user_id, :floss_id, :floss_quantity)
    end
end
