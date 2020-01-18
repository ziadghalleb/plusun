class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @services = Service.all
  end

  def show
    @booking = Booking.new
  end

  def update
    @service.update(service_params)

    redirect_to service_path(@service)
  end

  def destroy
    @service.destroy

    redirect_to services_path
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:category, :name, :description, :price_hourly, :price_daily)
  end

end
