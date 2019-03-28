class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :purchase_order, index: true, foreign_key: true
      t.string :description, null: false, default: ""
      t.string :title, null: false, default:  ""
      t.timestamps
    end
  end
end
