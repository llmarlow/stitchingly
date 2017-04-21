class Release < ApplicationRecord
  belongs_to :sal
  mount_uploader :picture, PictureUploader
  validates :name, :uniqueness => {:scope=>:sal_id}
  validates :name, :picture, :sal, presence: true
end
