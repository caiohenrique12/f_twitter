require 'rails_helper'

RSpec.describe "home/index", type: :view do

  before(:each) do
    assign(:users, [
      @user = User.create!(
        :name => 'Lilyan M',
        :email => 'lilya.m@gmail.com',
        :password => '123456',
        :password_confirmation => '123456'
      )
    ])
  end

  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "MyString",
        :text => "MyString",
        :user_id => @user.id
      ),
      Post.create!(
        :title => "MyString",
        :text => "MyString",
        :user_id => @user.id
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "MyString".to_s, :count => 2
    assert_select "tr>td", :text => "MyString".to_s, :count => 2
    assert_select "tr>td", :text => @user.id.to_s, :count => 2
  end

end
