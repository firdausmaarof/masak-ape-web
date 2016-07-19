class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe
      t.string :resipi
      t.integer :cuisine_id
      t.string :instruction, :limit => 10000
      t.string :arahan, :limit => 10000
      t.string :time
      t.string :photo
      t.decimal :rating, :precision => 5, :scale => 2
    end

    add_foreign_key :recipes, :cuisines, :on_update => :cascade, :on_delete => :cascade
  end
end
