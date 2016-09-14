class AddLayerableToClothing < ActiveRecord::Migration
  def change
    add_column :clothings, :layerable, :boolean
  end
end
