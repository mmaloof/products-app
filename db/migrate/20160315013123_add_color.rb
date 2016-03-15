class AddColor < ActiveRecord::Migration
  def change
    add_column :products, :color, :string
  end
end
