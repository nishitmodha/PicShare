class Photo < ApplicationRecord
    belongs_to :user
    has_one_attached :user_photo
end
