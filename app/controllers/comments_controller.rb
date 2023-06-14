class CommentsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment created successfully.'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Unable to create comment.'
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
