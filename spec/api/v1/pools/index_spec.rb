require "rails_helper"

RSpec.describe "pools#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/pools", params: params
  end

  describe "basic fetch" do
    let!(:pool1) { create(:pool) }
    let!(:pool2) { create(:pool) }

    it "works" do
      expect(PoolResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["pools"])
      expect(d.map(&:id)).to match_array([pool1.id, pool2.id])
    end
  end
end
