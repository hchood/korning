class AddEmployeeIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :employee_id, :integer
    Sale.reset_column_information
    Sale.all.each do |sale|
      employee_info = sale.employee.split(' ')
      employee = Employee.find_by(last_name: employee_info[1], first_name: employee_info[0])
      sale.update_attribute(:employee_id, employee.id)
    end
  end

  def down
    remove_column :sales, :employee_id
  end
end
