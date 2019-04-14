class PurchaseOrdersController < ApplicationController

  def index
    @purchase_orders = PurchaseOrder.page(params[:page]).per(8)
  end

end