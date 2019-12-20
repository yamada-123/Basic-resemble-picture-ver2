class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }  
  before_validation { email.downcase! }
  mount_uploader :image, ImageUploader
  has_secure_password
  validates :password, presence: true, length: { minimum:6 }, on: :create

  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
end
