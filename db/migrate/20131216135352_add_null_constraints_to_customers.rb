class AddNullConstraintsToCustomers < ActiveRecord::Migration
  def up
    change_column :customers, :name, :string, null: false
    change_column :customers, :account_no, :string, null: false
  end

  def down
    change_column :customers, :name, :string
    change_column :customers, :account_no, :string
  end
end
