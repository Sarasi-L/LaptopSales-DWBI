# 💻 Laptop Sales Data Warehouse & Business Intelligence Solution

This project is a complete end-to-end Data Warehousing and Business Intelligence (DWBI) solution designed for a fictional laptop retail company. It demonstrates how raw transactional and operational data can be transformed into structured insights using Microsoft’s BI tools: SQL Server, SSIS, SSAS, and Power BI.

## 📌 Project Overview

The project simulates a real-world retail environment with data sourced from 7 CSV files and 1 TXT file, covering customers, brands, models, laptops, stores, suppliers, and sales transactions. The goal was to design and implement a robust BI pipeline that integrates these sources, structures them into a Snowflake schema, and delivers actionable insights through dashboards.

## 🔧 Key Components

- 💾 **Data Warehouse Design**: Snowflake schema with hierarchical product modeling (Brand → Model → Laptop)
- ⚙️ **ETL Process**: Built with SQL Server Integration Services (SSIS) to load data from CSV/TXT files into a normalized SQL Server source database (`Laptop_Selling_SourceDB`)
- 🔁 **Slowly Changing Dimensions (SCD Type 2)**: Implemented for `Customer`, `Laptop` and `Supplier` dimensions to preserve historical changes
- 📦 **OLAP Cube (SSAS)**: Multidimensional data model for time-based and product-based analysis
- 📊 **Power BI Dashboards**: Visual reports with slicers, KPIs, drill-downs, and cascading filters

## 🔍 Features

- Integrated data from heterogeneous file formats (CSV and TXT)
- Hierarchical dimension structure (Brand > Model > Laptop)
- Time-based analytics using `DimDate` table (Year, Quarter, Month)
- Drill-through and filter-based insights in Power BI
- Clean schema with referential integrity and performance-optimized joins

## 🧰 Tools Used

- Microsoft SQL Server Management Studio (SSMS)
- SQL Server Integration Services (SSIS)
- SQL Server Analysis Services (SSAS)
- Power BI
- Microsoft Excel

## 📈 Outcome

This project demonstrates a complete data warehousing lifecycle — from source data ingestion and transformation to analytical modeling and business reporting. It showcases real-world BI implementation skills, data integration, and dashboard development to drive decision-making.


