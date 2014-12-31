class Pin < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true
  validates :user_id, presence: true
  has_attached_file :image, styles: { medium: "320x240>"}
  validates_attachment :image, 
                        presence: true,
                        size: { less_than: 5.megabytes },
                        content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end

end


