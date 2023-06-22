class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 2)
    @current_user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0
    if @post.save
      redirect_to user_posts_path(@user.id)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    authorize! :destroy, @post
    if @post.destroy
      flash[:notice] = 'Post deleted successfully'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
