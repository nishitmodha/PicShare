class Photo < ApplicationRecord
    belongs_to :user
    has_one_attached :user_photo
    has_many :comments, dependent: :destroy
    is_impressionable
    acts_as_votable
end
