module Entrepreneur
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    
        
    def index
      @projects = policy_scope([:entrepreneur, Project.where(user: current_user)])
    end
    
    def show
    
    end
    
    def new
      @project = current_user.projects.new
      authorize [:entrepreneur, @project]
    end

    def create
      @user    = current_user
      @user.update(is_entrepreneur: true, next_action: :connect_slack )
      @project = Project.new(project_params)
      @project.user = @user

      authorize [:entrepreneur, @project]

      if @project.save
        redirect_to entrepreneur_project_path(@project), notice: "Project was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @project.update(project_params)
        redirect_to entrepreneur_project_path(@project), notice: "project was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @project.destroy
      redirect_to entrepreneur_projects_url, notice: "project was successfully destroyed."
    end


    private

    def set_project
      @project = Project.find(params[:id])
      authorize [:entrepreneur, @project]
    end

    def project_params
      params.require(:project).permit(:name, :description, :pain, :target, :solution)
    end

  end
end