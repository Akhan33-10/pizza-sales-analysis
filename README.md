# 🍕 Pizza Sales Analysis 2015

## 📊 Project Overview
An end-to-end data analysis project analyzing pizza sales data 
using PostgreSQL for data storage and querying, and Power BI 
for interactive dashboard visualization.

## 🛠️ Tools Used
- **PostgreSQL** — Database design, data import, SQL queries
- **Power BI** — Interactive dashboard and DAX measures
- **pgAdmin 4** — Database management

## 🗄️ Database Schema
4 tables connected via foreign keys:
- `pizza_types` — Pizza menu categories and ingredients
- `pizzas` — Pizza sizes and prices
- `orders` — Order date and time
- `order_details` — Order line items and quantities

## 📈 Key KPIs
| Metric | Value |
|---|---|
| Total Revenue | $818K |
| Total Orders | 21K |
| Avg Order Value | $38.31 |
| Avg Orders Per Day | 59.64 |

## 🔍 Key Insights
- **Peak hours:** 12pm–1pm (lunch rush dominates)
- **Best month:** July ($72K revenue)
- **Top pizza by revenue:** The Thai Chicken Pizza ($43K)
- **Best category:** Classic ($220K)
- **Most popular size:** Large (45.89% of sales)

## 📊 Dashboard Features
- Monthly revenue and orders trend
- Top 5 pizzas by revenue
- Revenue by category
- Sales by pizza size
- Peak order hours
- Interactive slicers — Category, Month, Size

## 💾 SQL Highlights
- Table creation with ENUM types and foreign keys
- Complex JOINs across 4 tables
- Window functions (LAG) for MOM% growth
- CTEs for average calculations
- EXTRACT for time-based analysis

## 📁 Files
- `pizza_sales.sql` — Schema and analytical queries
- `pizza_analysis.pbix` — Power BI dashboard

## 🚀 How to Run
1. Create database `pizza_analysis_db` in PostgreSQL
2. Run `pizza_sales.sql` to create tables
3. Import CSV files in order:
   - pizza_types → pizzas → orders → order_details
4. Open `pizza_analysis.pbix` in Power BI Desktop
5. Update PostgreSQL connection credentials
