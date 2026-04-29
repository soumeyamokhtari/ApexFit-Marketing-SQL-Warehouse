# ApexFit: Marketing Analytics SQL Data Warehouse

### 1. Project Overview
This is a relational database (RDBMS) built to track digital advertising spend and sales performance for a fitness brand. 

I designed this to solve a common commercial problem: identifying which marketing campaigns are generating ROI and which are wasting budget on low-quality traffic.

### 2. Core Business Logic: The "Kill Phase"
The queries in this project act as a diagnostic tool. If an ad spends significant budget but yields zero sales, the SQL logic automatically flags it as a **"Kill Phase."** This allows marketing teams to immediately cut funding to failing ads and protect company profit margins.

### 3. Database Architecture (Schema)
The data is split into 5 normalised tables to ensure data integrity:
* **Advertisers:** The companies funding the ad campaigns.
* **Campaigns:** High-level marketing objectives (e.g., "New Year Sale").
* **Ads:** The specific creative assets presented to users.
* **Keywords:** Search terms that triggered the ads.
* **Performance:** The fact table tracking clicks, spend, and sales conversions.

> ![Database ER Diagram](ER%20Diagram.png)

### 4. How to Run This Project
Run the SQL files in the following order to reconstruct the database:
1. `01_schema_creation.sql` – Creates the empty tables, primary keys, and foreign key relationships.
2. `02_mock_data.sql` – Inserts sample operational data so the tables can be queried.
3. `03_analysis_queries.sql` – Executes the business logic reports, including the ROI tracking and "Kill Phase" identification.
