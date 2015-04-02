class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
    change_column :articles, :title, :text
  end
end
