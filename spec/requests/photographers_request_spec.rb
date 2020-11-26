require 'rails_helper'

RSpec.describe "Photographers", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/photographers/new"
      expect(response).to have_http_status(:success)
    end
  end

end
