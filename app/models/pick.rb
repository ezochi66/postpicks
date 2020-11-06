class Pick < ApplicationRecord
    belongs_to :group
    mount_uploader :picture, PictureUploader
    #下は本番環境では、コメントアウト解除
    # validates :picture, presence: true
    validates :description, length: { in: 1..140 }
    geocoded_by :address
    after_validation :geocode, if: :address_changed?


    def self.search(search)
      return Pick.all unless search
      # Pick.where(['address LIKE ? OR location LIKE ? OR description LIKE ? OR feel LIKE ? OR group_id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
      Pick.where(['feel LIKE ? OR group_id LIKE ?', "%#{search}%", "%#{search}%"])
    end

    # private
    #   def geocode
    #     uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=ENV['API_KEY']")
    #     res = HTTP.get(uri).to_s
    #     response = JSON.parse(res)
    #     self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    #     self.longitude = response["results"][0]["geometry"]["location"]["lng"]
    #   end
end
