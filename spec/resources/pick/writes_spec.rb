require 'rails_helper'

RSpec.describe PickResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'picks',
          attributes: { }
        }
      }
    end

    let(:instance) do
      PickResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Pick.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:pick) { create(:pick) }

    let(:payload) do
      {
        data: {
          id: pick.id.to_s,
          type: 'picks',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PickResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { pick.reload.updated_at }
      # .and change { pick.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:pick) { create(:pick) }

    let(:instance) do
      PickResource.find(id: pick.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Pick.count }.by(-1)
    end
  end
end
