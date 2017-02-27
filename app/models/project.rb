class Project < ApplicationRecord
  belongs_to :user
  has_many :updates, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :status, presence: true
  validates :name, :uniqueness => {:scope=>:user_id}
  validates :user, presence: true
  acts_as_votable
  scope :notprivate, -> { where(private: false) }

  def email_format
    self.user.email.split("@").first
  end

  def total_hours
    self.updates.sum(:hours)
  end
end
