# frozen_string_literal: true

module UserOrders
  class CreateService < Orders::BaseService
    def call
      UserOrder.create(params)
      # @user_order = current_user.user_orders.create(purchase_order_id: @purchase_order.id)
    end
  end
end
