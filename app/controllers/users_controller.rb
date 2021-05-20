class UsersController < ApplicationController
  after_action :skip_authorization
  def favorites
    @projects = current_user.liked_projects
    # skip_authorization
  end

  def ranking
  end
end
