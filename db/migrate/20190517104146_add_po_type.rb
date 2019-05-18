class AddPoType < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_orders, :purchase_order_type, :string, null: false, default: ""
  end
end
