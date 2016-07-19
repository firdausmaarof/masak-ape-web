class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :occasion
      t.string :majlis
    end
  end
end
