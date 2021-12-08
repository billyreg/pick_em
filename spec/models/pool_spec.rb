require "rails_helper"

RSpec.describe Pool, type: :model do
  describe "Direct Associations" do
    it { should have_many(:memberships) }

    it { should have_many(:weeks) }
  end

  describe "InDirect Associations" do
    it { should have_many(:members) }
  end

  describe "Validations" do
  end
end
