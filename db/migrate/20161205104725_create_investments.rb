class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :investments do |t|
      t.integer :sum
      t.float :return
      t.references :user, foreign_key: true
      t.references :asset, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
