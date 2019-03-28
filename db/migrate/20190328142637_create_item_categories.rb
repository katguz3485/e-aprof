class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.string :name, null: false, default: ""
      t.references :purchase_order, foreign_key: true, null: false

      t.timestamps
    end
  end
end
