class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,            presence: true
  validates :information,     presence: true 
  validates :category_id,     presence: true
  validates :status_id,       presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id,   presence: true
  validates :schedule_id,     presence: true
  validates :price,           presence: true
  validates :image,           presence: true
end
