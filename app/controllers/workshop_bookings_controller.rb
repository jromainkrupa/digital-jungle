class WorkshopBookingsController < ApplicationController
  def create
    @workshop = Workshop.find(params[:workshop_id])
    @workshop_booking = WorkshopBooking.new(workshop: @workshop, user: current_user)

    authorize @workshop_booking

    respond_to do |format|
      if @workshop_booking.save
        format.html.phone { redirect_to workshop_path(@workshop), notice: "Vous êtes bien inscrit au workshop." }
        format.html { redirect_to workshop_path(@workshop), notice: "Vous êtes bien inscrit au workshop." }
      else
        format.html { render :back, status: :unprocessable_entity }
      end
    end
  end

  private 

  def workshop_booking_params
    params.require(:workshop_booking).permit(:workshop_id)
  end
end
