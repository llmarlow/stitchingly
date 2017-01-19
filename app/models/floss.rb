class Floss < ApplicationRecord
  validates :colour, presence: true
  validates :colour, uniqueness: true
  has_many :user_flosses
  has_many :users, through: :user_flosses
end
