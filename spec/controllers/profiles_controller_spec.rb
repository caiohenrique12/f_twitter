require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
    end
  end

  describe "GET #details" do
    it "returns http success" do
      get :details
    end
  end

end
