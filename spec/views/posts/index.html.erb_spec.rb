require 'rails_helper'

RSpec.describe "posts/index", type: :view do

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

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "My Title".to_s, :count => 2
    assert_select "tr>td", :text => "My Text".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
