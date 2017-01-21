require 'rails_helper'

RSpec.describe Project, type: :model do
  describe Project do
    it "has a valid factory" do
      FactoryGirl.create(:project).should be_valid
    end
    it "is invalid without a name" do
      should validate_presence_of(:name)
    end
    it "is does not allow duplicate names" do
      should validate_uniqueness_of(:name)
    end
  end
end
