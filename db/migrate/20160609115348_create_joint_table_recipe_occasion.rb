class CreateJointTableRecipeOccasion < ActiveRecord::Migration
  def change
    create_join_table :recipes, :occasions, table_name: :occasions_recipes do |t|
	  t.integer :recipe_id
	  t.integer :occasion_id
	end

	add_foreign_key :occasions_recipes, :recipes, :on_update => :cascade, :on_delete => :cascade
	add_foreign_key :occasions_recipes, :occasions, :on_update => :cascade, :on_delete => :cascade
  end
end
