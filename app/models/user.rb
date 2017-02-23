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
end
