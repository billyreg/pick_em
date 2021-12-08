require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:memberships) }

    it { should have_many(:picks) }
  end

  describe "InDirect Associations" do
    it { should have_many(:pools) }
  end

  describe "Validations" do
  end
end
