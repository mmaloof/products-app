class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 6, scale: 2
      t.string :image

      t.timestamps null: false
    end
  end
end
