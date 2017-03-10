require 'rails_helper'

RSpec.describe "posts/new", type: :view do

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
    assign(:post, Post.new(
      :title => "MyString",
      :text => "MyText",
      :user_id => @user.id
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_text[name=?]", "post[text]"

      assert_select "hidden#post_user_id[name=?]", "post[user_id]"
    end
  end
end
