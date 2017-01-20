FactoryGirl.define do
  factory :user_floss do
    association :user, :factory => :user
    association :floss, :factory => :floss
    floss_quantity 1
  end
end
