class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :fabrics, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :user_flosses, dependent: :destroy
  has_many :flosses, through: :user_flosses
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :username, format: { with: /\A[a-z0-9]+\z/ }
  acts_as_voter
  extend FriendlyId
  friendly_id :username

  def social_link(link)
    uri = URI("#{link}")
    path = uri.path
    path.delete! '/'
  end
end
