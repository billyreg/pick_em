require "rails_helper"

RSpec.describe MembershipResource, type: :resource do
  describe "serialization" do
    let!(:membership) { create(:membership) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(membership.id)
      expect(data.jsonapi_type).to eq("memberships")
    end
  end

  describe "filtering" do
    let!(:membership1) { create(:membership) }
    let!(:membership2) { create(:membership) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: membership2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([membership2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:membership1) { create(:membership) }
      let!(:membership2) { create(:membership) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      membership1.id,
                                      membership2.id,
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
                                      membership2.id,
                                      membership1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
