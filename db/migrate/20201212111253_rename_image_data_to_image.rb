class RenameImageDataToImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :image_data, :image
  end
end
