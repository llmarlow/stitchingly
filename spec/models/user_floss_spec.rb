require 'rails_helper'

RSpec.describe UserFloss, type: :model do
  describe Floss do
    it "has a valid factory" do
      FactoryGirl.create(:user_floss).should be_valid
    end
    it "is invalid without a floss" do
      user = FactoryGirl.create(:user)
      UserFloss.create(:user => user, :floss_quantity => 1).should_not be_valid
    end

    it "is invalid without a user" do
      floss = FactoryGirl.create(:floss)
      UserFloss.create(:floss => floss, :floss_quantity => 1).should_not be_valid
    end

    it "is invalid with duplicate floss_id and user_id" do
      floss = FactoryGirl.create(:floss)
      user = FactoryGirl.create(:user)
      userfloss1 = UserFloss.create(:floss => floss, :floss_quantity => 2, :user => user)
      UserFloss.create(:floss => floss, :floss_quantity => 2, :user => user).should_not be_valid
    end
  end
end
