class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:pitches).where(pitches: {is_publishable: true})
  end

  def show
    @project = Project.find(params[:id])
    @project_messages = ProjectMessage.where("project_id = ?", params[:id]).last(5)
    # FetchMessagesFromProjectJob.perform_later(@project, 5)
  end
end
