class HomeController < ApplicationController
  def index
    @posts = Post.find_by_post(current_user.id)
  end
end
