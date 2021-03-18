class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :user_name, presence: true
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_voter
end
