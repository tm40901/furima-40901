class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_fee, :prefecture, :schedule
  
  belongs_to :user
  has_one_attached :image

  validates :name,            presence: true
  validates :information,     presence: true 
  validates :price,           presence: true
  validates :image,           presence: true

  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :schedule_id, numericality: { other_than: 1, message: "can't be blank"} 
end
