class HomeController < ApplicationController
  def index
    @posts = Post.find_by_post(current_user.id)

    if params[:email].present?
      @user = User.find_by_user_email(params[:email])
    end
  end
end
