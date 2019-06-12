# frozen_string_literal: true

module PurchaseOrders
  class CreateService < Orders::BaseService
    def call
      PurchaseOrder.create(params)
    end
  end
end
