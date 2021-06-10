class WorkshopBookingsController < ApplicationController
  def create
    @workshop = Workshop.find(params[:workshop_id])
    @workshop_booking = WorkshopBooking.new(workshop: @workshop, user: current_user)

    authorize @workshop_booking

    if @workshop_booking.save
      redirect_to workshop_path(@workshop), notice: "Vous êtes bien inscrit au workshop."
    else
      render :back, status: :unprocessable_entity
    end
  end

  private 

  def workshop_booking_params
    params.require(:workshop_booking).permit(:workshop_id)
  end
end
