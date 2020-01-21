class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.service_id = params[:service_id]
    @booking.save
    flash[:notice]= "Votre reservation est enregistree"
    redirect_to service_path(params[:service_id])
  end

  def update
    @booking.update(booking_params)

    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy

    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
