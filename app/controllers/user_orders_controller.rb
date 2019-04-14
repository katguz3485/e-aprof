class UserOrdersController < ApplicationController

  before_action :set_purchase_order, only: [:show]

  def index
    @user_orders = current_user.purchase_orders
  end


  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:id)
  end


end
