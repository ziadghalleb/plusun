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

      if !params[:query][:sexe].empty?
        @services = @services.select { |service| service.user.sexe == params[:query][:sexe] }
      end

      if !params[:query][:alcool].empty?
        @services = @services.select { |service| service.user.alcool == params[:query][:alcool] }
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
    # raise
    @enable_dates = prepdate_enable
    # @disable_dates = prepdate_disable

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

  def prepdate_enable
    @service.user.availabilities.map do |availability|
      {
        from: availability.start_date.strftime('%Y-%m-%d %H:%M'),
        to: availability.end_date.strftime('%Y-%m-%d %H:%M')
      }
    end
  end

  #  def prepdate_disable
  #   @service.bookings.map do |availability|
  #     {
  #       from: availability.start_date.strftime('%Y-%m-%d %H:%M'),
  #       to: availability.end_date.strftime('%Y-%m-%d %H:%M')
  #     }
  #   end
  # end
end
