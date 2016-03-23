class RenameDescriptionInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :description, :name
  end
end
