class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :ingredient
      t.string :ramuan

      t.timestamps null: false
    end
  end
end
