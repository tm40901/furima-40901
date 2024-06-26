class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only:[:index, :create]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
    if @item.user.id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    @price = @item.price

    if @order_form.valid? 
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code,
                                       :prefecture_id,
                                       :city, 
                                       :address, 
                                       :building,
                                       :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:   @price,
      card:     order_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
