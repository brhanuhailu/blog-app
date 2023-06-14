class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :desc).paginate(page: params[:page], per_page: 1)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created successfully.'
      redirect_to posts_path(@post)
    else
      flash[:alert] = 'Unable to create post.'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
