class WorkshopBookingsController < ApplicationController
  def create
    @workshop = Workshop.find(params[:workshop_id])
    @workshop_booking = WorkshopBooking.new(workshop: @workshop, user: current_user)

    authorize @workshop_booking

    raise

    respond_to do |format|
      if @workshop_booking.save
        format.html.phone { redirect_to workshop_booking_path(@workshop), notice: "Vous êtes bien inscrit au workshop." }
        format.html { redirect_to workshop_booking_path(@workshop_booking), notice: "Vous êtes bien inscrit au workshop." }
      else
        format.html { redirect_to @workshop, notice: "Something went wrong" }
      end
    end
  end

  def show
    @workshop_booking = WorkshopBooking.find(params[:id])
  end

  private 

  def workshop_booking_params
    params.require(:workshop_booking).permit(:workshop_id)
  end
end
