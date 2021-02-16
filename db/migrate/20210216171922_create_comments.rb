class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.integer :commentable_id
      t.string :commentable_type
      t.string :description
      t.timestamps
    end
  end
end
