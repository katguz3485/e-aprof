class CreateGrants < ActiveRecord::Migration[5.2]
  def change
    create_table :grants do |t|
      t.string :grant_name, null: false, default: ""
      t.string :grant_code, null: false, default: ""
      t.timestamps
    end
  end
end
