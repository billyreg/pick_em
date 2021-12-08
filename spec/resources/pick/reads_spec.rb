require "rails_helper"

RSpec.describe PickResource, type: :resource do
  describe "serialization" do
    let!(:pick) { create(:pick) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(pick.id)
      expect(data.jsonapi_type).to eq("picks")
    end
  end

  describe "filtering" do
    let!(:pick1) { create(:pick) }
    let!(:pick2) { create(:pick) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: pick2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([pick2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:pick1) { create(:pick) }
      let!(:pick2) { create(:pick) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      pick1.id,
                                      pick2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      pick2.id,
                                      pick1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
