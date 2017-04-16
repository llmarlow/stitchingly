class Sal < ApplicationRecord
  validates :name, :company, presence: true
  validates :name, uniqueness: true
  mount_uploader :picture, PictureUploader

  def released_on
    date = self.start_date
    date.strftime("#{date.day.ordinalize}")
  end

  def company_link
    self.link.split('/').first
  end
end
