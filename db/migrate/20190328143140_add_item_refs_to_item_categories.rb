class AddItemRefsToItemCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :item_categories, :item, foreign_key: true
  end
end
