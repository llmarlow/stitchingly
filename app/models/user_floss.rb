class UserFloss < ApplicationRecord
  belongs_to :user
  belongs_to :floss
  validates :floss_id, :user_id, presence: true
  validates :floss_id, :uniqueness => {:scope=>:user_id}
  validates :floss_quantity, :numericality => { :greater_than_or_equal_to => 0 , message: "Quantity cannot be less than 0" }

  def increase(user_floss)
    quantity = user_floss.floss_quantity
    user_floss.floss_quantity += 1
    user_floss.save
  end

  def decrease(user_floss)
    @quantity = user_floss.floss_quantity
    @quantity = @quantity - 1
    if @quantity == -1 then @quantity = 0 end
    user_floss.floss_quantity = @quantity
    user_floss.save
  end

end
