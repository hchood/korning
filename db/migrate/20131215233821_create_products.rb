class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end

    Sale.all.each do |s|
      unless Product.exists?(name: s.product_name)
        Product.create(name: s.product_name)
        puts "#{s.product_name} created!"
      else
        puts "#{s.product_name} already in table."
      end
    end
  end
end
