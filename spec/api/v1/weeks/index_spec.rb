require "rails_helper"

RSpec.describe "weeks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/weeks", params: params
  end

  describe "basic fetch" do
    let!(:week1) { create(:week) }
    let!(:week2) { create(:week) }

    it "works" do
      expect(WeekResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["weeks"])
      expect(d.map(&:id)).to match_array([week1.id, week2.id])
    end
  end
end
