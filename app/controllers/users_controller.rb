class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @posts = @user.posts.paginate(page: params[:page], per_page:2)
    @comments = @user.comments.paginate(page: params[:page], per_page:2)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Rails beginner!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile was updated"
      redirect_to @user
    else
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :github_link)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You're not allow to do that."
      redirect_to root_path
    end
  end
end