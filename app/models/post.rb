class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  validates :description, presence: true, length: {maximum: 255}
end
