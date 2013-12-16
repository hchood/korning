class EmployeesController < ApplicationController
  # show all employees on index page
  def index
    @employees = Employee.all
  end

  # show info for a single employee
  def show
    @employee = Employee.find(params[:id])
  end
end
