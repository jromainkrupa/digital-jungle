class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing_entrepreneur, :landing_contributor]

  def pitch_list
    @pitches = Pitch.includes(:project)
  end
end
