class Device < ApplicationRecord
  has_many :metrics
  belongs_to :user
  validates :name, presence: true
  validates :user_id, presence: true

  scope :mine, -> (user_id) { where(user_id: user_id) }

  mount_uploader :image, ImagesUploader
end