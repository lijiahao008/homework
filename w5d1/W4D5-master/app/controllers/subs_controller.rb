class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]
  before_action :has_to_be_moderator, only: [:edit, :update, :destroy]
  before_action :require_sign_in, except: [:index, :show]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private

  def has_to_be_moderator
    unless current_user.id == @sub.user_id
      flash[:errors] = "You are not my boss"
      redirect_to sub_url(@sub)
    end
  end

  def set_sub
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
