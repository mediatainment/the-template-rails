require 'rails_helper'

RSpec.describe EmailController, :type => :controller do

  describe "GET #contact_form" do
    it "returns http success" do
      get :contact_form
      expect(response).to have_http_status(:success)
    end
  end

end
