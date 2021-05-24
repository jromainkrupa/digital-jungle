class ProjectsController < ApplicationController
  def index
    @projects = policy_scope(Project.includes(:pitches).where(pitches: {is_publishable: true}))
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
    @project_messages = ProjectMessage.where("project_id = ?", params[:id]).last(5)
  end
end
