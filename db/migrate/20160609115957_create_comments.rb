class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.string :comment
      t.integer :recipe_id
    end

    add_foreign_key :comments, :recipes, :on_update => :cascade, :on_delete => :cascade
  end
end
