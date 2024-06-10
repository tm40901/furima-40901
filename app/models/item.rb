class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name,            presence: true
  validates :information,     presence: true 
  validates :price,           presence: true
  validates :image,           presence: true

  validates :category_id, 
            :status_id, 
            :shipping_fee_id, 
            :prefecture_id, 
            :schedule_id, numericality: { other_than: 1, message: "can't be blank"} 

  validates :price, numericality: { only_integer: true, 
                                    greater_than_or_equal_to: 300, 
                                    less_than_or_equal_to: 9999999 }
end
