class ServicesController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
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
    @service = Services.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:category, :name, :description, :price_hourly, :price_daily)
  end

end
