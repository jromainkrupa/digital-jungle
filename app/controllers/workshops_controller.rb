class WorkshopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_workshop, only: [:show,:edit,:update]

  def index
    @workshops = policy_scope Workshop.all
  end

  def show
    @workshops = Workshop.where.not(id: @workshop.id)
  end

  def new
    @workshop = Workshop.new
    authorize @workshop
  end

  def create
    @workshop = Workshop.new(workshop_params)
    authorize @workshop

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: 'Post was successfully created'}
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    if @workshop.update(workshop_params)
      redirect_to workshop_path(@workshop), notice: "workshop was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 

  def set_workshop
    @workshop = Workshop.friendly.find(params[:id])
    authorize @workshop
  end

  def workshop_params
    params.require(:workshop).permit(:name, :body,:value_added, :start_date, :duration, :image_url, :capacity, :user_id)
  end
end
