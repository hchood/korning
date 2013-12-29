class SalesController < ApplicationController

 # Displays sales within last 13 months
  def index
    @sales = Sale.sales_in_last_13_months
  end

  def show
    @sale = Sale.find(params[:id])
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sale }
      else
        format.html { render action: 'new' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def sale_params
    params.require(:sale).permit(:sale_amount, :units_sold, :invoice_frequency, :invoice_no, :employee_id, :product_id, :customer_id, :sale_date)
  end

end
