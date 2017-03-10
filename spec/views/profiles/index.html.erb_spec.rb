require 'rails_helper'

RSpec.describe "profiles/index.html.erb", type: :view do

  before(:each) do
    assign(:users, [
      @user = User.create!(
        :name => 'User',
        :email => 'user@gmail.com',
        :password => '123456',
        :password_confirmation => '123456'
        )
      ])
  end

  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "My Title",
        :text => "My Text",
        :user_id => @user.id
      ),
      Post.create!(
        :title => "My Title",
        :text => "My Text",
        :user_id => @user.id
      )
    ])
  end

end
