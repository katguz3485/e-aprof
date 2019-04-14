# frozen_string_literal: true

class PurchaseOrdersController < ApplicationController
  def index
    @purchase_orders = PurchaseOrder.page(params[:page]).per(5)
  end
end
