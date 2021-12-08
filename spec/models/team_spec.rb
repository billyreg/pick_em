require "rails_helper"

RSpec.describe Team, type: :model do
  describe "Direct Associations" do
    it { should have_many(:picks) }

    it { should have_many(:underdog_games) }

    it { should have_many(:favorite_games) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
