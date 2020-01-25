class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @services = Service.all
    @users = User.all
  end

  def dashboard
    @user = current_user
    # @booking.user = current_user
    # @booking.user_id = params[:service_id]
  end
end
