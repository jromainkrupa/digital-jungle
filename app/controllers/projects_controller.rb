class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:pitches)
  end

  def show
    @project = Project.find(params[:id])
  end
end
