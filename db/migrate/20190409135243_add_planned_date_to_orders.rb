class AddPlannedDateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_orders, :planned_order_date, :date, null: false, default: ""
  end
end