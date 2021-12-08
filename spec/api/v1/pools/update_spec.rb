require "rails_helper"

RSpec.describe "pools#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/pools/#{pool.id}", payload
  end

  describe "basic update" do
    let!(:pool) { create(:pool) }

    let(:payload) do
      {
        data: {
          id: pool.id.to_s,
          type: "pools",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PoolResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { pool.reload.attributes }
    end
  end
end
