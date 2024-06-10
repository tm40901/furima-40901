class OrderForm
  include ActiveModel::Model

  attr_accessor :item_id,
                :user_id,
                :post_code,
                :prefecture_id,
                :city,
                :address,
                :building,
                :phone_number,
                :order_id
  
  validates :post_code,    presence: true
  validates :city,         presence: true 
  validates :address,      presence: true
  validates :phone_number, presence: true
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank"}
  
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipment.create(post_code: post_code, 
                    prefecture_id: prefecture_id, 
                    city: city,
                    address: address,
                    building: building,
                    phone_number: phone_number,
                    order_id: order.id)
  end
end