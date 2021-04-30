class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing_entrepreneur]

  def home
  end

  def pitch_list
    @pitches = Pitch.includes(:project)
  end

  def choose_universe
  end

  def entrepreneur_tutorial
  end

  def contributor_tutorial
  end
end
