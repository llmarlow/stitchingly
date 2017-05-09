class Floss < ApplicationRecord
  validates :colour, presence: true
  validates_uniqueness_of :colour, scope: [:brand, :floss_type]
  has_many :user_flosses
  has_many :users, through: :user_flosses

  def self.by_brand_and_type(brand = nil, type = nil)
    return where(brand: brand, floss_type: type) if brand && type
    return where(brand: brand) if brand
    return where(floss_type: type) if type
    all
  end

  def user_floss
    self.user_flosses.where(floss: self).first
  end

  def user_floss_quantity
    self.user_floss.floss_quantity
  end
end