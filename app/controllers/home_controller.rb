class HomeController < ApplicationController
  def index
    @posts = Post.find_by_post(current_user.id)

    if params[:email]
      if User.find_by_user_email(params[:email])
        @user = User.find_by_user_email(params[:email])
      else
        @user = []
      end
    end
  end
end
