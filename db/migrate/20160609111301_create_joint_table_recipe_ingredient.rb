class CreateJointTableRecipeIngredient < ActiveRecord::Migration
  def change
    create_join_table :recipes, :ingredients, table_name: :ingredients_recipes do |t|
	  t.integer :recipe_id
	  t.integer :ingredient_id
	end

	add_foreign_key :ingredients_recipes, :recipes, :on_update => :cascade, :on_delete => :cascade
	add_foreign_key :ingredients_recipes, :ingredients, :on_update => :cascade, :on_delete => :cascade
  end
end
