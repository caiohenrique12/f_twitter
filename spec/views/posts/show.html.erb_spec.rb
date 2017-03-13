require 'rails_helper'

RSpec.describe "posts/show", type: :view do

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
    @post = assign(:post, Post.create!(
      :title => "Title",
      :text => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
