class AddProductIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :product_id, :integer
    Sale.reset_column_information
    Sale.all.each do |s|
      p = Product.find_by(name: s.product_name)
      s.update_attribute(:product_id, p.id)
    end
  end

  def down
    remove_column :sales, :product_id
  end
end
