class PurchaseOrdersController < ApplicationController

  before_action :set_purchase_order, only: [:show]


  def index
    @purchase_orders = PurchaseOrder.page(params[:page]).per(8)
  end


  def show
  end

  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:id)
  end


end