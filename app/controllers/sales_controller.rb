class SalesController < ApplicationController

 # Displays sales within last 13 months
  def index
    @sales = Sale.all.where('sale_date BETWEEN :start AND :end', start: 13.months.ago, end: Time.now)
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
