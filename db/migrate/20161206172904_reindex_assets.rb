class ReindexAssets < ActiveRecord::Migration[5.0]
  def change
    Asset.reindex
  end
end
