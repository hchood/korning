class SalesController < ApplicationController

 # Displays sales within last 13 months
  def index
    @sales = Sale.sales_in_last_13_months
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
