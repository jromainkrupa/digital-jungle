class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @user    = current_user
    @user.update(is_entrepreneur: true)
    @project = Project.new(project_params)
    @project.user = @user

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.where(user: current_user)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

end
