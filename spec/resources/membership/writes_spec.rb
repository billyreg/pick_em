require "rails_helper"

RSpec.describe MembershipResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "memberships",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MembershipResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Membership.count }.by(1)
    end
  end

  describe "updating" do
    let!(:membership) { create(:membership) }

    let(:payload) do
      {
        data: {
          id: membership.id.to_s,
          type: "memberships",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MembershipResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { membership.reload.updated_at }
      # .and change { membership.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:membership) { create(:membership) }

    let(:instance) do
      MembershipResource.find(id: membership.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Membership.count }.by(-1)
    end
  end
end
