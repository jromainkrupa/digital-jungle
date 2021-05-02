class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:pitches).where(pitches: {is_publishable: true})
  end

  def show
    @project = Project.find(params[:id])
  end
end
