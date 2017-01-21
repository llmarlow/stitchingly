FactoryGirl.define do
  factory :project do
    name "MyString"
    notes "MyText"
    progress 1
    status "MyString"
    association :user, :factory => :user
  end
end
