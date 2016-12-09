class CreateAssetPhotoTable < ActiveRecord::Migration[5.0]
  def change
    create_table :asset_photos do |t|
      t.references :asset, index: true, foreign_key: true
      t.string :photo

      t.timestamps null: false
    end
  end
end
