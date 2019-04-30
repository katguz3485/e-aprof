class AddTypeIndexOnUserInItems < ActiveRecord::Migration[5.2]
  def change
    add_index :items, [:type, :user_id]
  end
end
