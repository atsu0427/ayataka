class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user, dependent: :destroy
    mount_uploader :image, ImageUploader
end
