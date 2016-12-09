class AddPhotosToAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :photos, :json
  end
end
