require "rails_helper"

RSpec.describe "memberships#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/memberships/#{membership.id}"
  end

  describe "basic destroy" do
    let!(:membership) { create(:membership) }

    it "updates the resource" do
      expect(MembershipResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Membership.count }.by(-1)
      expect { membership.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
