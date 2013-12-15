class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_and_account_no

      t.timestamps
    end
    Sale.all.each do |s|
      unless Customer.exists?(customer_and_account_no: s.customer_and_account_no)
        Customer.create(customer_and_account_no: s.customer_and_account_no)
        puts "#{s.customer_and_account_no} created!"
      else
        puts "#{s.customer_and_account_no} already in table."
      end
    end
  end
end
