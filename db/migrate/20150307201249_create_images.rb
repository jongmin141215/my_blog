class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :description
      t.binary :image

      t.timestamps null: false
    end
    change_column :images, :description, :text
  end
end
