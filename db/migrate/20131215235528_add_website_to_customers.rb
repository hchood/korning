class AddWebsiteToCustomers < ActiveRecord::Migration
  def up
    add_column :customers, :website, :string
    Customer.reset_column_information
    Customer.all.each do |customer|
      id = customer.id
      if id == 1
        customer.update_attribute(:website, 'http://www.apple.com')
      elsif id == 2
        customer.update_attribute(:website, 'http://www.motorola.com')
      elsif id == 3
        customer.update_attribute(:website, 'http://www.lg.com')
      elsif id == 4
        customer.update_attribute(:website, 'http://www.htc.com')
      elsif id == 5
        customer.update_attribute(:website, 'http://www.nokia.com')
      elsif id == 6
        customer.update_attribute(:website, 'http://www.samsung.com')
      end
    end
  end

  def down
    remove_column :customers, :website
  end
end
