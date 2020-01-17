class BookingsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
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
    @booking = Bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:title, :start_date, :end_date)
  end

end
