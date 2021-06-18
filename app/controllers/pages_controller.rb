class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:pricing, :landing_entrepreneur, :landing_contributor, :landing_pitch_app, :landing_workshops]
  def choose_universe
    @tasks = ["grocery","stuff","prepare livecode", "show rails to students"]
  end

  def landing_workshops
    @workshops = Workshop.all
  end

end
