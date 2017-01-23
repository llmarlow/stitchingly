class ProjectsController < ApplicationController
  before_action :set_user, except: [:new, :all]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /projects
  # GET /projects.json
  def index
    @user = User.find(params[:user_id])
    @projects = @user.projects
  end

  def all
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = @user.projects.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = @user.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.json

  def create
    @project = @user.projects.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to user_project_path(@user, @project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @user_floss }
      else
        format.html { render :new }
        format.json { render json: @user_floss.errors, status: :unprocessable_entity }
      end
    end
  end
 

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project = @user.projects.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to user_project_path(@user, @project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = @user.projects.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_path(@user), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :notes, :progress, :status, :user_id, :pattern_name, :pattern_designer, :fabric_brand, :fabric_colour, :fabric_count, :thread_brand)
    end
end