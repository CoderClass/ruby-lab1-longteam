class Photo < ApplicationRecord
    has_many :comments, dependent: :destroy
    mount_uploader :avatar, AvatarUploader
end
