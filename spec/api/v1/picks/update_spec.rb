require "rails_helper"

RSpec.describe "picks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/picks/#{pick.id}", payload
  end

  describe "basic update" do
    let!(:pick) { create(:pick) }

    let(:payload) do
      {
        data: {
          id: pick.id.to_s,
          type: "picks",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PickResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { pick.reload.attributes }
    end
  end
end
