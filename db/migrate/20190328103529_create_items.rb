class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :type, null: false
      t.references :user, foreign_key: true, null: false
      t.string :item_name, null: false, default: ""
      t.string :link, null: false, default: ""
      t.decimal :item_price, precision: 8, scale: 2
      t.string :catalogue_number, null: false, default: ""
      t.string :provider_name, null: false, default: ""
      t.string :number_of_items, null: false, default: ""
      t.string :packaging, null: false, default: ""
      t.string :remarks, null: false, default: ""

      t.timestamps
    end
  end
end
