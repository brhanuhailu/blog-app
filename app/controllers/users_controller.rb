class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    if params[:id] == 'sign_out'
      sign_out(current_user)
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @posts = @user.posts
      @current_user = current_user
    end
  end
end
