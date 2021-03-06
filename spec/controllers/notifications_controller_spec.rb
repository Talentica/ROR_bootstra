require "rails_helper"
RSpec.describe NotificationsController, type: :controller do
  before(:each, user_sign_in: true) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @created_user = create(:user)
    sign_in @created_user
  end

  describe "GET #logged in user", user_sign_in: true do
    let(:expected_response) { JSON.parse(response.body)["user"] }
    it "returns a user id" do
      get :logged_in_user
      expect(expected_response).to be_instance_of(Fixnum)
    end
  end

  describe "Push a notification", user_sign_in: true do
    let(:expected_response) { JSON.parse(response.body) }
    let(:expected_status) { JSON.parse(expected_response["message"]) }
    let(:url) { "/notification/#{@created_user.id}" }
    it "returns a user id" do
      post :send_notifications, url: url, data: "test"
      # TODO: insert test to be done in model test
      expect(@created_user.reload.push_notifications).not_to eq(0)
      expect(expected_status[0]["successful"]).to be(true)
    end
  end
end
