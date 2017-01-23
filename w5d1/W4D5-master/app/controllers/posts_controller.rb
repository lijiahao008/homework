class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :require_sign_in, except: [:show]
  before_action :require_author, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to subs_url
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to subs_url
    end
  end

  def edit

  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to sub_url(@post.sub_id)
    end
  end

  def destroy
    @post.destroy
    redirect_to subs_url
  end

  private

  def require_author
    unless current_user.id == @post.user_id
      flash[:errors] = "You are nor the author"
      redirect_to new_session_url
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
