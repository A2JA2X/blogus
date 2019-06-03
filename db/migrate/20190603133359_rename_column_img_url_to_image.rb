class RenameColumnImgUrlToImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :img_url, :image
  end
end
