korning
=======

Normalization Challenge

=======

TO DO:

1. Create employees table - DONE

2. Break up fields into individual fields
      Employee: first, last, email -DONE
      Customer: name, account number - DONE

3. Add associations b/w models

4. Remove unnecessary columns from Sales (e.g. product_name)

5. Create views (& controllers/actions) to display:
      Employee list (employee info must not be repeated)
      Customer list (Invoice freq should be listed with each customer? Ask about this - customers have more than one invoice freq)
      Product list
      Sales w/in last 3 months (or 13 mo -- sales are old; show date, amount, invoice no., units sold, price per unit)
      Employee profile (name, email, all of that employee's sales sorted by sale_amount DESC)

      Non-core:

      Submit new sales data:
        sale_amount must be valid decimal
        units must be valid integer
        invoice freq must be Monthly, Quarterly, or Once
        invoice no, = alphanumeric, may start w/ a 0
        must have associated salesperson
        must have a product
        must have a customer

      Show given employee's sales graphically using line or column chart to display aggregated sales by month for 2012. Use JavaScript graphing library.

