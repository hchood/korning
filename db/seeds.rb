require 'csv'

datafile = Rails.root + 'db/data/sales.csv'

def format_as_decimal(value)
  value.gsub(/[$]/, '').to_d
end

CSV.foreach(datafile, headers: true) do |row|
  Sale.find_or_create_by(invoice_no: row['invoice_no']) do |sale|
    sale.employee = row['employee']
    sale.customer_and_account_no = row['customer_and_account_no']
    sale.product_name = row['product_name']
    sale.sale_date = row['sale_date']
    sale.sale_amount = format_as_decimal(row['sale_amount'])
    sale.units_sold = row['units_sold']
    sale.invoice_no = row['invoice_no']
    sale.invoice_frequency = row['invoice_frequency']

    puts "Sale with invoice no. #{sale.invoice_no} processed"
  end
end
