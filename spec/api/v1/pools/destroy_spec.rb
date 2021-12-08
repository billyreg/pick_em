require "rails_helper"

RSpec.describe "pools#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/pools/#{pool.id}"
  end

  describe "basic destroy" do
    let!(:pool) { create(:pool) }

    it "updates the resource" do
      expect(PoolResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Pool.count }.by(-1)
      expect { pool.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
