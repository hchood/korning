class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false

      t.timestamps
    end

    Sale.all.each do |sale|
      employee_info = sale.employee.split(' ')

      employee_hash = {
        first_name: employee_info[0],
        last_name: employee_info[1],
        email: employee_info[2].gsub(/[()]/, '')
      }

      Employee.find_or_create_by(employee_hash)
    end
  end
end
