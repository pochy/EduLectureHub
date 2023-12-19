require 'rails_helper'

RSpec.describe "Lectures", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/lectures/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/lectures/show"
      expect(response).to have_http_status(:success)
    end
  end

end
