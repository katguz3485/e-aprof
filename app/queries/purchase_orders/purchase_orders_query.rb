# frozen_string_literal: true

module PurchaseOrders
  class PurchaseOrderQuery
    def self.upcoming_orders(relation: PurchaseOrder, params:)
      relation.where('planned_order_date >= ?', Date.today).page(params).per(30)
    end
  end
end
