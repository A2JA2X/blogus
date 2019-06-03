class Article < ApplicationRecord
  has_many :comments
  belongs_to :user
  # アップローダ
  mount_uploader :image, ImageUploader
end
