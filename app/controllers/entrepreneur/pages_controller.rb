module Entrepreneur
  class PagesController < BaseController
    def tutorial
      skip_authorization
      if params[:done] == "true" && !current_user.watched_tutorial?
        current_user.watched_tutorial = true
        current_user.next_action = :create_project
        if current_user.save
          redirect_to entrepreneur_dashboard_path, notice: "First next accomplished congratulations!" 
        else
          render :tutorial, status: :unprocessable_entity
        end
      end
    end
  end
end
