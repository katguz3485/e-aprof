class RemoveNameColumnFromUserOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_orders, :name
  end
end
