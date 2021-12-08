require "rails_helper"

RSpec.describe "weeks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/weeks/#{week.id}", params: params
  end

  describe "basic fetch" do
    let!(:week) { create(:week) }

    it "works" do
      expect(WeekResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("weeks")
      expect(d.id).to eq(week.id)
    end
  end
end
