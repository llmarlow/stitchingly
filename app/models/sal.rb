class Sal < ApplicationRecord
  validates :name, :company, presence: true
  validates :name, uniqueness: true
  mount_uploader :picture, PictureUploader
end
