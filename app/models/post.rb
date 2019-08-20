class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, foreign_key: 'post_id', dependent: :destroy
  has_many :users, through: :favorites
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  mount_uploader :image, ImageUploader
  
  validates :image, presence: true
end
