class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home,:pricing, :landing_entrepreneur, :landing_contributor, :landing_pitch_app]
  def choose_universe
    @tasks = ["grocery","stuff","prepare livecode", "show rails to students"]
  end

end
