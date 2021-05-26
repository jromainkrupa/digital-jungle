class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing_entrepreneur, :landing_contributor]
  def choose_universe
    @tasks = ["grocery","stuff","prepare livecode", "show rails to students"]
  end
end
