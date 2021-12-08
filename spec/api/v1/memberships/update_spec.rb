require "rails_helper"

RSpec.describe "memberships#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/memberships/#{membership.id}", payload
  end

  describe "basic update" do
    let!(:membership) { create(:membership) }

    let(:payload) do
      {
        data: {
          id: membership.id.to_s,
          type: "memberships",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(MembershipResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { membership.reload.attributes }
    end
  end
end
