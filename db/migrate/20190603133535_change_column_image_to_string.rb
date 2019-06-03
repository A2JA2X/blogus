class ChangeColumnImageToString < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :image, :string
  end
end
