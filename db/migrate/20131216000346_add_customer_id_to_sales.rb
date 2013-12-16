class AddCustomerIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :customer_id, :integer
    Sale.reset_column_information
    Sale.all.each do |s|
      c = Customer.find_by(customer_and_account_no: s.customer_and_account_no)
      s.update_attribute(:customer_id, c.id)
    end
  end

  def down
    remove_column :sales, :customer_id
  end
end
