# frozen_string_literal: true

class UserOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase_order, only: %i[show edit update destroy]
  before_action :set_user_order, only: %i[show edit update destroy]

  def index
    @user_orders = current_user.purchase_orders
  end

  private

  def set_user_order
    @user_order = UserOrder.find(params[:id])
  end

  def user_order_params
    params.require(:user_order).permit(:id, :purchase_order_id)
  end

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:purchase_order_id])
  end
end
