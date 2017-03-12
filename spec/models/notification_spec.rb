require 'rails_helper'

RSpec.describe Notification, type: :model do
  @user_1 = User.create(name: 'Caio Henrique', email: 'caiohenriqueads@gmail.com', password: '123456', password_confirmation: '123456')
  @user_2 = User.create(name: 'Lilyan Monteiro', email: 'monteirolilyan@gmail.com', password: '123456', password_confirmation: '123456')

  subject {
    described_class.create(follower_id: 1, followed_id: 2, active: true)
  }

  it "Should be a valid" do
    expect(subject).to be_valid
  end

end
