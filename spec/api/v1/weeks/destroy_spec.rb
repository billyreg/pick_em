require "rails_helper"

RSpec.describe "weeks#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/weeks/#{week.id}"
  end

  describe "basic destroy" do
    let!(:week) { create(:week) }

    it "updates the resource" do
      expect(WeekResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Week.count }.by(-1)
      expect { week.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
