class HomeController < ApplicationController
  def index
    @posts = Post.find_by_user_id(current_user.id)
  end
end
