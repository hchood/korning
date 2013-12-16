class AddAccountNoAndNameToCustomers < ActiveRecord::Migration
  def up
    add_column :customers, :account_no, :string
    add_column :customers, :name, :string

    Customer.all.each do |customer|
      customer_info = customer.customer_and_account_no.split(' ')
      customer.update_attribute(:account_no, customer_info[1].gsub(/[()]/, ''))
      customer.update_attribute(:name, customer_info[0])
    end
  end

  def down
    remove_column :customers, :account_no
    remove_column :customers, :name
  end
end
