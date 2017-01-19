class UserFloss < ApplicationRecord
  belongs_to :user
  belongs_to :floss
  validates :floss_id, :user_id, presence: true
  validates :floss_quantity, :numericality => { :greater_than_or_equal_to => 0 , message: "Quantity cannot be less than 0" }
end
