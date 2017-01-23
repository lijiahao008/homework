class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render :new
  end

  def create
    # debugger
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to subs_url
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
