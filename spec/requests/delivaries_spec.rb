require 'rails_helper'

RSpec.describe "Delivaries", type: :request do
  describe "GET /delivaries" do
    it "works! (now write some real specs)" do
      get delivaries_path
      expect(response).to have_http_status(200)
    end
  end
end
