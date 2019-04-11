class AddUserOrderReferenceToPurchaseOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchase_orders, :user_order, foreign_key: true
  end
end
