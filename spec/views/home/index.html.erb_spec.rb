require 'rails_helper'

RSpec.describe "home/index", type: :view do

  before(:each) do
    assign(:users, [
      @user = User.create!(
        :name => 'Usuario',
        :email => 'usuario@gmail.com',
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
        :user_id => 1
      ),
      Post.create!(
        :title => "MyString",
        :text => "MyString",
        :user_id => 1
      )
    ])

  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "MyString".to_s, :count => 2
    assert_select "tr>td", :text => "MyString".to_s, :count => 2
    assert_select "tr>td", :text => 1, :count => 2
  end

end
