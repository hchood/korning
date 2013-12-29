class DropColumnsFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :employee
    remove_column :sales, :product_name
    remove_column :sales, :customer_and_account_no
  end

  def down
    add_column :sales, :customer_and_account_no, :string
    add_column :sales, :product_name, :string
    add_column :sales, :employee, :string
  end
end
