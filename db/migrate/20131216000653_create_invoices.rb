class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :sale_id
      t.integer :customer_id
      t.decimal :bill_amount

      t.timestamps
    end

    populate_invoices
  end

  def populate_invoices
    Sale.all.each do |sale|
      hash = {
        sale_id: sale.id,
        customer_id: sale.customer_id,
      }

      if sale.invoice_frequency == 'Quarterly'
        hash[:bill_amount] = sale.sale_amount / 4
      elsif sale.invoice_frequency == 'Monthly'
        hash[:bill_amount] = sale.sale_amount / 12
      else
        hash[:bill_amount] = sale.sale_amount
      end

      Invoice.create(hash)
    end
  end
end
