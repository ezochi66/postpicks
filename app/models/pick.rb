class Pick < ApplicationRecord
    belongs_to :group
    has_many :comments
    mount_uploader :picture, PictureUploader
    #下は本番環境では、コメントアウト解除
    # validates :picture, presence: true
    validates :description, length: { in: 0..140 }
    geocoded_by :address
    after_validation :geocode, if: :address_changed?


    # def self.search(search)
    #   return Pick.all unless search
    #   @search_name = search
    #   # Pick.where(['address LIKE ? OR location LIKE ? OR description LIKE ? OR feel LIKE ? OR group_id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    #   Pick.where(['feel LIKE ? OR group_id LIKE ?', "%#{search}%", "%#{search}%"])
    # end
end
