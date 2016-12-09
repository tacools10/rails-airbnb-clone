class ChangePhotoToArray < ActiveRecord::Migration[5.0]
  def change
    change_column :assets, :photos, :text
  end
end
