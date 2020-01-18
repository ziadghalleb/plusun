class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.service_id = 2
    duration = (@booking.end_date - @booking.start_date)/3600
    @booking.total_price = 20 * duration


    raise
    @booking.save
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
    params.require(:booking).permit(:start_date, :end_date, :service_id)
  end

end
