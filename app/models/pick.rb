class Pick < ApplicationRecord
    belongs_to :group
    mount_uploader :picture, PictureUploader
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def self.search(search)
      return Pick.all unless search
      Pick.where(['address LIKE ? OR location LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    end
end
