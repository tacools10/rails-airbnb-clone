class AddPostCodeToAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :post_code, :string
  end
end
