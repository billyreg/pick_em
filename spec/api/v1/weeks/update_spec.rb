require "rails_helper"

RSpec.describe "weeks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/weeks/#{week.id}", payload
  end

  describe "basic update" do
    let!(:week) { create(:week) }

    let(:payload) do
      {
        data: {
          id: week.id.to_s,
          type: "weeks",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(WeekResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { week.reload.attributes }
    end
  end
end
