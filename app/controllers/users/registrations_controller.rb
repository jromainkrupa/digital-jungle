# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   if params[:choice]
  #   resource.update(is_entrepreneur: is_entrepreneur_choice)
  #   redirect_to_good_tutorial(resource)
  #   else
  #     super
  #   end

  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  private
  # def redirect_to_good_tutorial(resource)
  #   if resource.is_entrepreneur
  #     redirect_to entrepreneur_tutorial_path
  #   else
  #     redirect_to contributor_tutorial_path
  #   end
  # end

  # def is_entrepreneur_choice
  #   if params[:choice] == 'contributeur'
  #     false
  #   elsif params[:choice] == 'entrepreneur'
  #     true
  #   end
  # end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    if session[:workshop].present?
      @workshop = Workshop.friendly.find(session[:workshop]["workshop_id"])
      @workshop_booking = WorkshopBooking.new(workshop: @workshop, user: current_user)
      session[:workshop] = nil
 
      if @workshop_booking.save
        flash[:notice] = "Vous avez bien posutlez au workshop: #{@workshop.name}"
        workshop_bookings_path
      else
        @workshop
      end
    else
      super
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
