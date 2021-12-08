require "rails_helper"

RSpec.describe WeekResource, type: :resource do
  describe "serialization" do
    let!(:week) { create(:week) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(week.id)
      expect(data.jsonapi_type).to eq("weeks")
    end
  end

  describe "filtering" do
    let!(:week1) { create(:week) }
    let!(:week2) { create(:week) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: week2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([week2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:week1) { create(:week) }
      let!(:week2) { create(:week) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      week1.id,
                                      week2.id,
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
                                      week2.id,
                                      week1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
