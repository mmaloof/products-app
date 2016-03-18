class DeleteIdFromSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :supplier_id, :integer
  end
end
