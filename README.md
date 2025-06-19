# Vendor-Sales-Performance-
Business Problem: Effective inventory and sales management are critical for optimizing profitability in the retail and wholesale industry. Companies need to ensure that they are not incurring losses due to inefficient pricing, poor inventory turnover, or vendor dependency. The goal of this analysis is to:
1.Identify underperforming brands that require promotional or pricing adjustments.
2.Determine top vendors contributing to sales and gross profit.
3.Analyze the impact of bulk purchasing on unit costs.
4.Assess inventory turnover to reduce holding costs and improve efficiency.
5.Investigate the profitability variance between high-performing and low-performing vendors.

The purchases table contains actual purchase data, including the date of purchase, products (brands) purchased by vendors, the amount paid (in dollars), and the quantity purchased.
The purchase price column is derived from the purchase_prices table, which provides product-wise actual and purchase prices. The combination of vendor and brand is unique in this table.
The vendor_invoice table aggregates data from the purchases table, summarizing quantity and dollar amounts, along with an additional column for freight.
This table maintains uniqueness based on vendor and PO number.
The sales table captures actual sales transactions, detailing the brands purchased by vendors, the quantity sold, the selling price, and the revenue earned.
As the data that we need for analysis is distributed in different tables, we need to create a summary table containing:
purchase transactions made by vendors
sales transaction data
freight costs for each vendor
actual product prices from vendors

Performance Optimization:
The query involves heavy joins and aggregations on large datasets like sales and purchases.
Storing the pre-aggregated results avoids repeated expensive computations.
Helps in analyzing sales, purchases, and pricing for different vendors and brands.
Future Benefits of Storing this data for faster Dashboarding & Reporting.
Instead of running expensive queries each time, dashboards can fetch data quickly from vendor_sales_summary.

Exploratory Data Analysis:
Previously, we examined the various tables in the database to identify key variables, understand their relationships, and determine which ones should be included in the final analysis.
In this phase of EDA, we will analyze the resultant table to gain insights into the distribution of each column. This will help us understand data patterns, identify anomalies, and ensure data quality before proceeding with further analysis

Summary Statistics Insights:
Negative & Zero Values:
Gross Profit: Minimum value is -52,002.78, indicating losses. Some products or transactions may be selling at a loss due to high costs or selling at discounts lower than the purchase price...
Profit Margin: Has a minimum of -00, which suggests cases where revenue is zero or even lower than costs.
Total Sales Quantity & Sales Dollars: Minimum values are 0, meaning some products were purchased but never sold. These could be slow-moving or obsolete stock.
Outliers Indicated by High Standard Deviations:
Purchase & Actual Prices: The max values (5,681.81 & 7,499.99) are significantly higher than the mean (24.39 & 35.64), indicating potential premium products.
Freight Cost: Huge variation, from 0.09 to 257,032.07, suggests logistics inefficiencies or bulk shipments.
Stock Turnover: Ranges from 0 to 274.5, implying some products sell extremely fast while others remain in stock indefinitely. Value more than 1 indicates that Sold quantity for that product is higher than purchased quantity due to either sales are being fulfilled from older stock.
