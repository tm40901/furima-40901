class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid? 
      @order_form.save
      redirect_to root_path
    else
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
                                       :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
