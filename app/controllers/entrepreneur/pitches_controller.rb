module Entrepreneur
  class PitchesController < BaseController
    before_action :set_project, only: [:show, :index, :destroy, :new, :create, :edit, :update]
    before_action :set_pitch, only: [:show, :edit, :update, :destroy]
    after_action :skip_authorization, only: [:index]

    def index
      @pitches = @project.pitches
    end

    def show
      authorize @pitch
    end

    def new
      @pitch = @project.pitches.new
      authorize [:entrepreneur, @pitch]
    end

    def create
      @pitch = Pitch.new(pitch_params)
      @pitch.project = @project
      authorize [:entrepreneur, @pitch]
      if @pitch.save
        redirect_to entrepreneur_project_pitch_path(@project, @pitch), notice: "Pitch was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @pitch.update(pitch_params)
        redirect_to entrepreneur_project_pitch_path(@project, @pitch), notice: "Pitch was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @pitch.destroy
      redirect_to entrepreneur_project_pitches_path, notice: "Pitch was successfully destroyed."
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_pitch
      @pitch = Pitch.find(params[:id])
    end

    def pitch_params
      params.require(:pitch).permit(:title, :video, :script)
    end
  end
end