require 'rails_helper'

RSpec.describe Floss, type: :model do
    describe Floss do
    it "has a valid factory" do
      FactoryGirl.create(:floss).should be_valid
    end
    it "is invalid without a colour" do
      should validate_presence_of(:colour)
    end
    it "is does not allow duplicate colours" do
      should validate_uniqueness_of(:colour)
    end
  end
end
