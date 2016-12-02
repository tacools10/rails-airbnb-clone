class AddCoordinatesToAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :latitude, :float
    add_column :assets, :longitude, :float
  end
end
