class Tag < ApplicationRecord
  has_many :taggings
  has_many :projects, through: :taggings
  has_many :sals

  def to_s
    name
  end
end
