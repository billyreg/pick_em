require "rails_helper"

RSpec.describe "memberships#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/memberships/#{membership.id}", params: params
  end

  describe "basic fetch" do
    let!(:membership) { create(:membership) }

    it "works" do
      expect(MembershipResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("memberships")
      expect(d.id).to eq(membership.id)
    end
  end
end
