class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
    change_column :users, :name, :text
    change_column :users, :email, :text
  end
end
