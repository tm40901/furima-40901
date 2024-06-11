class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, 
                :post_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id,
                :token
  
  with_options presence: true do
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, allow_blank: true}
  end
    validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank"}

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