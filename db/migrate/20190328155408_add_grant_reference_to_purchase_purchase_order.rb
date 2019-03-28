class AddGrantReferenceToPurchasePurchaseOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchase_orders, :grant, foreign_key: true
  end
end
