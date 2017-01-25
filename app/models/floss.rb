class Floss < ApplicationRecord
  validates :colour, presence: true
  validates :colour, uniqueness: true
  has_many :user_flosses
  has_many :users, through: :user_flosses

  def self.by_brand_and_type(brand = nil, type = nil)
    return where(brand: brand, floss_type: type) if brand && type
    return where(brand: brand) if brand
    return where(floss_type: type) if type
    all
  end
end