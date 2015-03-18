class AddImagesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image, :binary
  end
end
