class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @projects = policy_scope(Project.includes(:pitches).where(pitches: {is_publishable: true}).includes(:investments))
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
    @project_messages = ProjectMessage.where("project_id = ?", params[:id]).last(5)
  end
end
