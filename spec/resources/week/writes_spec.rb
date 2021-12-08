require "rails_helper"

RSpec.describe WeekResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "weeks",
          attributes: {},
        },
      }
    end

    let(:instance) do
      WeekResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Week.count }.by(1)
    end
  end

  describe "updating" do
    let!(:week) { create(:week) }

    let(:payload) do
      {
        data: {
          id: week.id.to_s,
          type: "weeks",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      WeekResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { week.reload.updated_at }
      # .and change { week.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:week) { create(:week) }

    let(:instance) do
      WeekResource.find(id: week.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Week.count }.by(-1)
    end
  end
end
