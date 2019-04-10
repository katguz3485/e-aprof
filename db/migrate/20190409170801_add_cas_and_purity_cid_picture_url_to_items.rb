class AddCasAndPurityCidPictureUrlToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :cid, :integer, null: false, default: 0
    add_column :items, :formula_url, :string, null: false, default: ""
    add_column :items, :cas_number, :string, null: false, default: ""
    add_column :items, :purity, :string, null: false, default: ""
  end
end

