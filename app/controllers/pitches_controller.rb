class PitchesController < ApplicationController
  def index
    @pitches = Pitch.includes(:project => :user)
  end

  def show
    @pitch = Pitch.find(params[:id])
  end
end
