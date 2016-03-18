class ChangeIntegertoStringOfSupplier < ActiveRecord::Migration
  def change
    change_column :suppliers, :phone, :string
  end
end
