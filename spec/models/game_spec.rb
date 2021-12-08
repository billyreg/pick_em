require "rails_helper"

RSpec.describe Game, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:underdog) }

    it { should belong_to(:favorite) }

    it { should belong_to(:week) }

    it { should have_many(:picks) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
