class Pick < ApplicationRecord
    belongs_to :group
    mount_uploader :picture, PictureUploader
end
