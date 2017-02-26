class Feature < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  acts_as_votable
  default_scope { order(:cached_votes_total=> :desc) } 
end