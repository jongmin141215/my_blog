class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :blogs, :users
  end
end
