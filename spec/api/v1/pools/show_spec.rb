require "rails_helper"

RSpec.describe "pools#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/pools/#{pool.id}", params: params
  end

  describe "basic fetch" do
    let!(:pool) { create(:pool) }

    it "works" do
      expect(PoolResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("pools")
      expect(d.id).to eq(pool.id)
    end
  end
end
