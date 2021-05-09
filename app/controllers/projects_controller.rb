class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:pitches).where(pitches: {is_publishable: true})
  end

  def show
    @project = Project.find(params[:id])
    @project_messages = FetchMessagesFromProjectJob.perform_now(@project, 5)
  end
end
