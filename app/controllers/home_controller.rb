# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    # we would like to show upcoming orders
    @purchase_orders = PurchaseOrder.all
  end
end
