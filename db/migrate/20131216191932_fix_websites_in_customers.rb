class FixWebsitesInCustomers < ActiveRecord::Migration
  def up
    Customer.all.each do |customer|
      name = customer.name
      if name == 'LG'
        customer.update_attribute(:website, 'http://www.lg.com')
      elsif name == 'HTC'
        customer.update_attribute(:website, 'http://www.htc.com')
      elsif name == 'Nokia'
        customer.update_attribute(:website, 'http://www.nokia.com')
      elsif name == 'Apple'
        customer.update_attribute(:website, 'http://www.apple.com')
      elsif name == 'Motorola'
        customer.update_attribute(:website, 'http://www.motorola.com')
      elsif name == 'Samsung'
        customer.update_attribute(:website, 'http://www.samsung.com')
      end
    end
  end

  def down
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
end
