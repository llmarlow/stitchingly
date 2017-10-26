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

  def self.get_userfloss_by_user_and_floss(user, floss)
    @return = nil
    if user != nil and floss != nil then
      @return = UserFloss.where(:user => user, :floss => floss).first
    end
    return @return
  end

  def self.get_userfloss_quantity_by_user_and_floss(user, floss)
    @return = 0
    if user != nil and floss != nil then
      @userfloss = UserFloss.where(:user => user, :floss => floss).first
      if @userfloss == nil then @return = 0 end
      if @userfloss != nil then 
        @return = @userfloss.floss_quantity 
      end
    end
    return @return
  end

end
