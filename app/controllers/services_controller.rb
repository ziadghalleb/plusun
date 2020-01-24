class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @services = Service.all
    @users = User.all
    if params[:query].present?

      if !params[:query][:category].empty?
        @services = @services.where(category: params[:query][:category])
      end

      if !params[:query][:name].empty?
        @services = @services.where(name: params[:query][:name])
      end

      if !params[:query][:tabac].empty?
        @services = @services.select { |service| service.user.tabac == params[:query][:tabac] }
      end


    else
      @services = Service.all
    end
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
