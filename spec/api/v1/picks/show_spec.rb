require 'rails_helper'

RSpec.describe "picks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/picks/#{pick.id}", params: params
  end

  describe 'basic fetch' do
    let!(:pick) { create(:pick) }

    it 'works' do
      expect(PickResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('picks')
      expect(d.id).to eq(pick.id)
    end
  end
end
