class ProfilesController < ApplicationController
  def index
    @user = User.find_by_user_email(params[:email])
    @followers = Relationship.new
    @posts = Post.find_by_post(@user[0][:id])
  end

  def follow
    @relationship = Relationship.follow_user(params[:follower_id], params[:followed_id])
    flash[:notice] = "Agora vocẽ esta seguindo(a)!"
    redirect_to :back
  end

  def details
  end
end
