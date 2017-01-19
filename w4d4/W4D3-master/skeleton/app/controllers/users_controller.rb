class UsersController < ApplicationController
  before_action :redirect_if_signed_in
  def create
    @user = User.create(user_params)
    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver

      redirect_to cats_url
    else
      flash[:notice] = "You can't rent these cats, but I can"
      redirect_to new_user_url
    end
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end


end
