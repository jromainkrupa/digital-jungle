class UsersController < ApplicationController
  def favorites
    @projects = current_user.liked_projects
  end

  def ranking
  end
end
