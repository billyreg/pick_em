require "rails_helper"

RSpec.describe "memberships#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/memberships", params: params
  end

  describe "basic fetch" do
    let!(:membership1) { create(:membership) }
    let!(:membership2) { create(:membership) }

    it "works" do
      expect(MembershipResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["memberships"])
      expect(d.map(&:id)).to match_array([membership1.id, membership2.id])
    end
  end
end
