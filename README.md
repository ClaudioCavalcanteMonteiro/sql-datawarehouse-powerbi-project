# Data Warehouse and Power BI Project

Welcome to the **Modern Data Warehouse Solution with Power BI Integration** Repository 💻​📊​

This project demonstrates a complete end-to-end data pipeline, from raw data sources to dashboards and insights. It includes:

🟢Understanding business requirements and analytical needs<br>
🟢ETL process development<br>
🟢Data warehouse architecture design<br>
🟢Data integration from multiple sources<br>
🟢Data cleansing and transformation<br>
🟢Data loading and optimization<br>
🟢Dimensional data modeling<br>
🟢SQL Server and Power BI integration<br>
🟢Dashboard UX design and publication<br>


It was developed as a portfolio showcase to demonstrate best practices in Data Engineering, Analytics, and Business Intelligence using modern data warehousing concepts.

---

## 📝 Requirements

Stakeholders want  insights about:

- ** Product Performance **
- ** Customer Behavior **
- ** Sales insights **

---

### Build the Data Warehouse (Engineering)


### 🎯 Goal
Build a modern Data Warehouse using SQL Server to consolidate data from ERP and CRM systems.

### ✅ Assumptions

- **Sources** : CSV Files provided by two systems (CRM and ERP).
- **Quality** : Resolve data quality issues such as duplicates, null values, inconsistent formatting, and unnecessary white spaces.
- **Integration**: Integrate and consolidate data sources into a unified data model optimized for analytical queries.
- **Scope** : Historical/legacy data is out of scope. The solution focuses only on the most recent and relevant datasets.
- **Documentation** : Provide clear, well-structured, and easy-to-understand documentation to support both business stakeholders and analytics teams

### 👷🏼 Data Architecture

<img width="1113" height="620" alt="Data Architecture Complete" src="https://github.com/user-attachments/assets/5e036950-e482-4701-8bbf-e38418958213" />


---

### 🔎 Analytcs and Dashboard (Data Analytics)

### 🎯 Goal
Develop SQL-based analytics to provide data for Power BI dashboards and generate insights aligned with business requirements.

Empower stakeholders with key business metrics and insights, enabling data-driven strategic decision-making.

---

# 🗄️ Repository Structure

```text

data-warehouse-powerbiproject/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project














