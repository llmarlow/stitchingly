class Project < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :picture, presence: true
  validates :status, presence: true
  validates :name, uniqueness: true
  validates :user, presence: true

  def email_format
    self.user.email.split("@").first
  end
end
