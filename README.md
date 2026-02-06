## Project Walkthrough Video

A 60-second walkthrough explaining the data, SQL analysis, key insights, and performance optimisation decisions.

📹 Watch here: [Project Walkthrough Video](PASTE_YOUR_LINK_HERE)


# SQL Analysis Project – London Non-Profit  
*(Fundraising & Donor Analysis)*

## Overview

This project analyses fundraising performance, donor behaviour, and revenue quality for a fictional London-based non-profit organisation.

The goal is to demonstrate **SQL-first analytical skills**, with a focus on:
- clean query logic  
- real business questions  
- performance awareness (indexing)

No dashboards were built. The emphasis is on **reproducible SQL analysis**.

---

## Data & Tables

The project uses **5 cleaned datasets**, loaded into MySQL as relational tables:

| Source CSV | Table Name |
|-----------|------------|
| 1 Beneficiaries.csv | `beneficiaries` |
| 2 Fundraising.csv | `fundraising` |
| 3 Programs Sessions.csv | `programs_sessions` |
| 4 Donors.csv | `donors` |
| 5 Operations Finance.csv | `operations_finance` |

**Total records analysed:** 100,000+

Source CSV files were ingested into MySQL using Python *(pandas + SQLAlchemy)*.

---

## Key Questions Answered

### 1️⃣ How does fundraising perform over time?
- Monthly aggregation of settled donations  
- Comparison of gross vs net revenue  
- Tracking donation volume and processing fees  

**Insight:**  
Net revenue consistently trails gross revenue due to processing fees, highlighting the importance of payment efficiency.

---

### 2️⃣ Are donations coming from new or returning donors?
- Identified each donor’s first-ever donation  
- Classified donations as **New** or **Returning**

**Insight:**  
Returning donors contribute higher average donation values, indicating retention has a greater revenue impact than acquisition alone.

---

### 3️⃣ Which payment channels generate the best net revenue?
- Compared settlement rates, fees, and net income by payment channel  

**Insight:**  
Some channels produce stronger net revenue despite fewer transactions due to lower fee rates.

---

### 4️⃣ Which donor segments drive the most value?
- Segmentation by donor type and CRM segment  

**Insight:**  
A small number of donor segments account for a disproportionate share of total net revenue.

---

### 5️⃣ Are there geographic or Gift Aid opportunities?
- Fundraising performance analysed by borough  
- Gift Aid eligibility rates reviewed  

**Insight:**  
Certain areas present opportunities to increase net income through improved Gift Aid capture without acquiring new donors.

---

## Performance Optimisation (Indexes)

Indexes were added to improve query performance on commonly joined and filtered columns:

```sql
CREATE INDEX idx_fundraising_donor_date
ON fundraising (donor_id, donation_date);

CREATE INDEX idx_fundraising_status_date
ON fundraising (status, donation_date);

CREATE INDEX idx_donors_type_segment
ON donors (donor_type, crm_segment);

 

These indexes reduce full table scans and reflect how analytical queries are optimised in production environments. 

 

## How to Reproduce This Project

1. Load the CSV files into MySQL  
2. Run SQL scripts in the `/sql` folder in numerical order  
3. Export query results to CSV  
4. Review outputs stored in `/outputs`

---

## Tools Used
- MySQL  
- SQL (joins, CTEs, aggregations, indexing)  
- Python (pandas for data ingestion only)

---

## Final Notes

This project focuses on clarity, correctness, and performance-aware SQL analysis, demonstrating skills beyond entry level while remaining grounded in real-world data problems.
