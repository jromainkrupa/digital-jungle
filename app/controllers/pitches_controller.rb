class PitchesController < ApplicationController
  before_action :set_project, only: [:new,:create, :show]
  before_action :set_pitch, only: [:show]

  def index

  end

  def show
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = Pitch.new(pitch_params)
    @pitch.project = @project
    if @pitch.save
      redirect_to [@project,@pitch], notice: "Pitch was successfully created."
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    
  end

  def update
    if @pitch.update(pitch_params)
      redirect_to @pitch, notice: "Pitch was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pitch.destroy
    redirect_to pitches_url, notice: "Pitch was successfully destroyed."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_pitch
    @pitch = Pitch.find(params[:id])
  end

  def pitch_params
    params.require(:pitch).permit(:title, :video)
  end
end
