class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def update
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def set_user
    @user = Users.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :height, :alcool, :tabac, :address)
  end

end
