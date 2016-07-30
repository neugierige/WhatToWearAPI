class CreateClothings < ActiveRecord::Migration
  def change
    create_table :clothings do |t|
      t.string :category
      t.string :style
      t.string :brand
      t.string :color
      t.string :seasons
      t.boolean :work_approp

      t.timestamps null: false
    end
  end
end
