class ProjectsController < ApplicationController
  attr_accessor :id

  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    if @user.projects.create(project_params)
      flash[:notice] = "Project was successfully created"
      redirect_to user_projects_path(@user)
    else
      flash[:alert] = "Something went wrong"
      redirect_to new_user_project_path(@user)
    end
  end

  def edit
    @user = User.find(params[:user_id])
    # @project = @user.projects.find(params[:project_ids])
  end

  def def update
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:id])

    if @project.update_attributes(params[:object])
      flash[:success] = "Object was successfully updated"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  # def update
  #    @user = User.find(params[:user_id])
  #    @project = @user.projects.find(params[:id])

  #    if @project.update(project_params)
  #     redirect_to user_projects_path(@user)
  #    else
  #     render :edit, status: :unprocessable_entity
  #    end
  # end

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
