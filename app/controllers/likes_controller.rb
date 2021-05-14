class LikesController < ApplicationController
  before_action :set_project
  def create
    @like = @project.likes.where(user_id: current_user.id).first_or_create(is_like: params[:is_like])
    respond_to do |format|
      if @like.save
        format.html { redirect_to @project, satus: "project liked"}
      else
        format.html { render @project}
      end
    end
  end

  def destroy
    @project.likes.where(user_id: current_user.id).destroy_all
    respond_to do |format|
      format.html { redirect_to @project, satus: "project liked"}
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
