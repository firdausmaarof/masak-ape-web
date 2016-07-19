class CreateJointTableRecipeIngredient < ActiveRecord::Migration
  def change
    create_join_table :recipes, :ingredients, table_name: :recipe_ingredient do |t|
	  t.integer :recipe_id
	  t.integer :ingredient_id
	end

	add_foreign_key :recipe_ingredient, :recipes, :on_update => :cascade, :on_delete => :cascade
	add_foreign_key :recipe_ingredient, :ingredients, :on_update => :cascade, :on_delete => :cascade
  end
end
