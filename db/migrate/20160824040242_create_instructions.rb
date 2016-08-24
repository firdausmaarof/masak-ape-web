class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :instruction
      t.string :arahan
      t.integer :recipe_id
    end

    add_foreign_key :instructions, :recipes, :on_update => :cascade, :on_delete => :cascade
  end
end
