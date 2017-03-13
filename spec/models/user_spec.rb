require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.create(email: 'fernanda@gmail.com', password: '123456', password_confirmation: '123456')
  }

  it "Should be a valid" do
    expect(subject).to be_valid
  end

  it "Should be a valid email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "Should be a valid password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "Should be a valid password_confirmation" do
    subject.password_confirmation = nil
    expect(subject).to_not be_valid
  end

  it "If email is unique" do
    user = User.create(name: 'Nathan Silva', email: 'nathansilva.s@gmail.com', password: '123456', password_confirmation: '123456')
    expect(subject.email).to_not eq(user.email)
  end

  it "Password have min 6 characters" do
    expect(subject.password.length).to be >= 6
  end

  it "Find user by email " do
    user = User.find_by_user_email(subject.email)
    user.eql?(subject)
  end
end
