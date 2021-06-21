class WorkshopBookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  skip_after_action :verify_authorized, only: [:create]
  def create
    if current_user.nil?
      session[:workshop] = params
      redirect_to new_user_registration_path
    else
      @workshop = Workshop.friendly.find(params[:workshop_id])
      @workshop_booking = WorkshopBooking.new(workshop: @workshop, user: current_user)

      authorize @workshop_booking

      respond_to do |format|
        if @workshop_booking.save
          format.html { redirect_to workshop_bookings_path, notice: "Vous êtes bien inscrit au workshop." }
        else
          format.html { redirect_to @workshop, notice: "Something went wrong" }
        end
      end
    end
  end

  def index
    if current_user.workshop_bookings.empty?
      @other_workshops = policy_scope Workshop.all
      @next_workshop = @other_workshops.sort_by(&:start_date).first
      @workshop_booking = @next_workshop
      
    else
      @workshop_booking = current_user.workshop_bookings.first
      @workshop_bookings = policy_scope(current_user.workshop_bookings)
      @next_workshop = @workshop_bookings.map(&:workshop).sort_by(&:start_date).first
      @other_workshops = Workshop.all - @workshop_bookings.map(&:workshop)
    end
  end

  private 

  def workshop_booking_params
    params.require(:workshop_booking).permit(:workshop_id)
  end
end
