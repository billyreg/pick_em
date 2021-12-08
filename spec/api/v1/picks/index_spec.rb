require 'rails_helper'

RSpec.describe "picks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/picks", params: params
  end

  describe 'basic fetch' do
    let!(:pick1) { create(:pick) }
    let!(:pick2) { create(:pick) }

    it 'works' do
      expect(PickResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['picks'])
      expect(d.map(&:id)).to match_array([pick1.id, pick2.id])
    end
  end
end
