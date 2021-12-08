require 'rails_helper'

RSpec.describe "picks#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/picks/#{pick.id}"
  end

  describe 'basic destroy' do
    let!(:pick) { create(:pick) }

    it 'updates the resource' do
      expect(PickResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Pick.count }.by(-1)
      expect { pick.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
