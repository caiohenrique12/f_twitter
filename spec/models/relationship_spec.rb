require 'rails_helper'

RSpec.describe Relationship, type: :model do

  @user_1 = User.create(name: 'Caio Henrique', email: 'caiohenriqueads@gmail.com', password: '123456', password_confirmation: '123456')
  @user_2 = User.create(name: 'Lilyan Monteiro', email: 'monteirolilyan@gmail.com', password: '123456', password_confirmation: '123456')

  subject {
    described_class.create(follower_id: 1, followed_id: 2)
  }
  it "Should be a valid" do
    expect(subject).to be_valid
  end

  it "Save the follow users" do
    relationship = Relationship.new
    relationship.follow_user(1,2)
  end

  it "How many followers a user has" do
    relationship = Relationship.how_many_followers(1)
    expect(relationship).to be >= 0
  end

  it "How many users follow" do
    relationship = Relationship.how_many_users_follow(1)
    expect(relationship).to be >= 0
  end

  it "Checks if user is already followed" do
    relationship = Relationship.new
    relationship.check_user_followed(2, 5)
    expect(relationship).to be_truthy
  end

  it "Notify user followed" do
    relationship = Relationship.notify_user_followed(1)
    expect(relationship).to be_truthy
  end

  it "Notify user followed" do
    relationship = Relationship.count_notify(1)
    expect(relationship).to be_truthy
  end

end
