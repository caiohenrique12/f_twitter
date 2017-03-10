class ProfilesController < ApplicationController
  def index
    @user = User.find_by_user_email(params[:email])
    @posts = Post.find_by_post(@user[0][:id])
  end

  def details
  end
end
