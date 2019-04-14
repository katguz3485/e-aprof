# frozen_string_literal: true

class PurchaseOrdersController < ApplicationController

  before_action :set_purchase_order, only: [:show]


  def index
    @purchase_orders = PurchaseOrder.where("planned_order_date >= ?", Date.today).page(params[:page]).per(6)
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
