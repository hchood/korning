class DropCustomerAndAccountNoFromCustomers < ActiveRecord::Migration
  def up
    remove_column :customers, :customer_and_account_no
  end

  def down
    add_column :customers, :customer_and_account_no, :string
    Customer.all.each do |customer|
      sale = Sale.find_by(customer_id: customer.id).first
      customer.update_attribute(:customer_and_account_no, sale.customer_and_account_no)
    end
  end
end
