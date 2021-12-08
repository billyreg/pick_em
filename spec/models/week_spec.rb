require "rails_helper"

RSpec.describe Week, type: :model do
  describe "Direct Associations" do
    it { should have_many(:games) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
