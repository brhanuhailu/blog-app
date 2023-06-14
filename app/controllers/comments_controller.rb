class CommentsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = 'Commented successfully!'
      redirect_to posts_path(@comment.post)
    else
      @article = Post.find(params[:post_id])
      redirect_to posts_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
