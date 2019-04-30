class AddCurrencyNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :currency_name, :string, null: false, default: "PLN"
  end
end
