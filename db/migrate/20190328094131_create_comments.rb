class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :commentable, null: false, polymorphic: true
      t.string :description, null: false, default: ""
      t.string :title, null: false, default:  ""
      t.timestamps
    end
  end
end

