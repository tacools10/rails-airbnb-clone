class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :address
      t.string :country
      t.string :city
      t.string :region
      t.string :condition
      t.integer :year_built
      t.integer :year_reno
      t.integer :bedrooms
      t.integer :bathrooms
      t.binary :garage
      t.integer :lots_size
      t.string :previous_owners
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
