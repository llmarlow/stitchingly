class Floss < ApplicationRecord
  validates :colour, presence: true
  validates :colour, uniqueness: true
  has_many :quantities
  has_many :users, through: :quantities
end
