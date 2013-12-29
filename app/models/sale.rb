class Sale < ActiveRecord::Base
  validates_presence_of :sale_date, :sale_amount, :units_sold, :invoice_frequency, :invoice_no, :employee_id, :product_id, :customer_id
  validates_numericality_of :sale_amount, greater_than: 0
  validates_format_of :units_sold, with: /\A\d+\z/
  validates_uniqueness_of :invoice_no
  validates_inclusion_of :invoice_frequency, in: %w(Monthly Quarterly Once)

  belongs_to :employee
  belongs_to :customer
  belongs_to :product
  has_many :invoices

  def self.sales_in_last_13_months
    Sale.all.where('sale_date BETWEEN :start AND :end', start: 13.months.ago, end: Time.now)
  end

  def price_per_unit
    self.sale_amount / self.units_sold
  end

  def formatted_unit_price
    "$#{sprintf('%.2f', self.price_per_unit)}"
  end

  def formatted_sale_amount
    "$#{sprintf('%.2f', self.sale_amount)}"
  end

  def self.invoice_frequencies
    ['Monthly', 'Quarterly', 'Once']
  end
end
