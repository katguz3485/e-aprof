class AddItemCategoryReferenceToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :item_category, null: false, foreign_key: true
  end
end
