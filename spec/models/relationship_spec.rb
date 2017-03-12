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
    relationship = Relationship.follow_user(1,2)
  end
end
