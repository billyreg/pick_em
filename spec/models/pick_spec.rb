require "rails_helper"

RSpec.describe Pick, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:team) }

    it { should belong_to(:game) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_one(:week) }
  end

  describe "Validations" do
  end
end
