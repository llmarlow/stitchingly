FactoryGirl.define do
  factory :floss do |f|
    f.colour  { Faker::Color.unique.color_name }
  end
end