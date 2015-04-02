class ChangeStringToText < ActiveRecord::Migration
  def change
    change_column :articles, :title, :text
    change_column :comments, :commenter, :text
    change_column :images, :description, :text
    change_column :users, :name, :text
    change_column :users, :email, :text
    change_column :users, :password_digest, :text
  end
end
