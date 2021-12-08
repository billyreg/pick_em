require "rails_helper"

RSpec.describe PoolResource, type: :resource do
  describe "serialization" do
    let!(:pool) { create(:pool) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(pool.id)
      expect(data.jsonapi_type).to eq("pools")
    end
  end

  describe "filtering" do
    let!(:pool1) { create(:pool) }
    let!(:pool2) { create(:pool) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: pool2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([pool2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:pool1) { create(:pool) }
      let!(:pool2) { create(:pool) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      pool1.id,
                                      pool2.id,
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
                                      pool2.id,
                                      pool1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
