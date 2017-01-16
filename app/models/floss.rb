class Floss < ApplicationRecord
  validates :colour, presence: true
  validates :colour, uniqueness: true
end
