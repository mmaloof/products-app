class AddMaterial < ActiveRecord::Migration
  def change
    add_column :products, :material, :string
  end
end
