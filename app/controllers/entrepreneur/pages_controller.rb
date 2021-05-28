module Entrepreneur
  class PagesController < BaseController
    def tutorial
      skip_authorization
      if params[:done] == "true" && !current_user.watched_tutorial?
        current_user.watched_tutorial = true
        current_user.next_action = :create_project
        if current_user.save
          redirect_to new_entrepreneur_project_path, notice: "First step accomplished congratulations!" 
        else
          render :tutorial, status: :unprocessable_entity
        end
      end
    end

    def tutorial_slack
      @project = Project.find(params[:project_id])
    end

    def congrats
      @project = Project.find(params[:project_id])
    end
  end
end
