class Sale < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer
  belongs_to :product
  has_many :invoices

  def self.sales_in_last_13_months
    Sale.all.where('sale_date BETWEEN :start AND :end', start: 13.months.ago, end: Time.now)
  end

  def price_per_unit
    @sale_amount / @units_sold
  end
end
