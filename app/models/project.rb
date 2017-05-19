class Project < ApplicationRecord
  belongs_to :user
  has_many :updates, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :status, presence: true
  validates :name, :uniqueness => {:scope=>:user_id}
  validates :user, presence: true
  acts_as_votable
  scope :notprivate, -> { where(private: false) }
  scope :nopicture, -> { where.not(:picture => nil) }

  def email_format
    self.user.email.split("@").first
  end

  def total_hours
    self.updates.sum(:hours)
  end

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end