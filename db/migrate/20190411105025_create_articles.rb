class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, index: true
      t.text :content
      t.text :img_url
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
