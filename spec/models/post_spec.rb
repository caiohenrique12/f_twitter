require 'rails_helper'

RSpec.describe Post, type: :model do

  # user = User.create(name: "Caio H", email: 'caio.henrique@gmail.com', password: '123456', password_confirmation: '123456')

  subject {
    described_class.create(title: 'Hello Word', text: 'A maldição sem hello word', user_id: 1)
  }

  it "Should be a valid" do
    expect(subject).to be_valid
  end

  it "Should be a valid title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "Should be a valid text" do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it "Should be a valid user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "Text have max 127 characters" do
    expect(subject.text.length).to be <= 127
  end

  it "Title have max 20 characters" do
    expect(subject.title.length).to be <= 20
  end

  it "Return all posts with user signed in" do
    post = Post.find_by_post(1)
    expect(post).to be
  end
end
