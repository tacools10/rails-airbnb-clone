class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.date :offer_date
      t.string :status
      t.string :offer_type
      t.references :asset, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
