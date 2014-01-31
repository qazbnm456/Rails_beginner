class PagesController < ApplicationController
  def home
    if signed_in?
      @posts = @current_user.posts.paginate(page: params[:page], per_page:3)
      @comments = @current_user.comments.paginate(page: params[:page], per_page:4)
    end
  end

  def help
  end

  def about
  end
end
