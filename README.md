# DCRM: Data Concern Remediation Management
### Enterprise Data Governance & Issue Resolution Framework

![Status](https://img.shields.io/badge/Status-Completed-success)
![Tools](https://img.shields.io/badge/Tools-Jira_|_SQL_|_Google_Cloud-blue)
![Domain](https://img.shields.io/badge/Domain-Data_Governance-orange)

## 📖 Project Overview
**DCRM** (Data Concern Remediation Management) is a realistic simulation of an enterprise-grade Data Governance program. It establishes a controlled lifecycle for handling data quality issues—from intake and severity assessment to root cause analysis (RCA), remediation, and SQL-based validation.

This project demonstrates the operational side of data engineering: ensuring data integrity through rigorous process control, SLA tracking, and audit-ready closure governance.

<img width="1895" height="747" alt="image" src="https://github.com/user-attachments/assets/e6e98152-eb65-4d4f-9e68-bc9e59de9b4a" />

---

## 🛠️ Tech Stack & Tools
* **Governance Engine:** Jira Cloud (Custom Workflow, Screens, Automation)
* **Database:** PostgreSQL (Neon/Supabase) for data storage and validation queries
* **Reporting:** Google Slides (Executive Decks) & Jira Dashboards (Operational Metrics)
* **Intake:** Google Forms / Typeform (Simulating business user reporting)
* **Documentation:** Confluence (Playbooks & Runbooks)

---

## ⚡ The Governance Workflow
I designed a custom Jira workflow (`HORIZON-DCRM`) that enforces separation of duties and validation gates.

<img width="1142" height="385" alt="image" src="https://github.com/user-attachments/assets/970afcc2-841d-4fb8-a9a3-2ed9f7e67e63" />

**Lifecycle Stages:**
1.  **Submitted:** Issue reported via Intake Form.
2.  **Intake:** Triage queue for initial review.
3.  **Assessment:** Analyst assigns Severity (Sev-1/2/3) and identifies Root Cause.
4.  **Remediation:** Engineering applies the fix (SQL Update/ETL Patch).
5.  **Validation:** **[Gate]** Automated SQL checks prove the issue is fixed (0 rows returned).
6.  **Closure Review:** **[Gate]** Manager approval required to close.
7.  **Closed:** Issue resolved.

<img width="1259" height="834" alt="image" src="https://github.com/user-attachments/assets/7b3f3cf7-9de6-44a3-b56a-88a11d644fb4" />


<img width="870" height="680" alt="image" src="https://github.com/user-attachments/assets/b16ee7dd-2953-49d2-b438-71c32dc91132" />

---

## 📊 Key Deliverables

### 1. Root Cause Analysis (RCA) Framework
Implemented a standard "5 Whys" approach to categorize issues, driving long-term prevention.
* **Categories:** People (Process), Technology (Code), Data (Vendor), Governance (Policy).
* **Outcome:** 50% of initial issues were identified as *Process Failures*, leading to recommended changes in intake validation rules.

### 2. SQL Validation "Proof of Fix"
No issue moves to closure without evidence.
* *Scenario:* Sales Revenue reporting negative values (`$-50,000`).
* *Remediation:* Corrected source entry.
* *Validation Query:*
    ```sql
    -- Evidence that no negative revenue rows remain
    SELECT count(*) as error_count 
    FROM sales_data 
    WHERE revenue < 0; 
    -- Result: 0
    ```
<img width="1453" height="583" alt="image" src="https://github.com/user-attachments/assets/07f536c6-4d1b-4872-bb34-fa44b88124cb" />

### 3. Control Reporting (Dashboards)
Built live Jira dashboards to track SLA adherence and backlog aging.

| Dashboard View | Metric Tracked |
| :--- | :--- |
| **Aging Matrix** | Severity vs. Status (Identifying stuck tickets) |
| **Root Cause Distribution** | % of issues caused by Process vs. Tech |
| **Throughput** | Created vs. Resolved weekly trends |

<img width="1371" height="668" alt="image" src="https://github.com/user-attachments/assets/2eb6a7a8-3f06-474c-aaed-cf3f90d2760b" />




---

## 📈 Professional Impact
* **Designed and executed** a full DCRM (Data Concern Remediation Management) workflow in Jira Cloud, including intake, remediation, validation, approvals, and closure governance.
* **Performed RCA (Root Cause Analysis)** and built SQL validation checks to confirm remediation effectiveness and prevent regressions across impacted reports.
* **Produced weekly control reporting** (Dashboards + Deck) to track aging, SLA adherence, and remediation outcomes end-to-end.

---

## 🚀 How to Replicate
1.  **Jira Setup:** Create a Company-Managed project. Import the workflow config from `/assets/workflow_config.xml`.
2.  **Database:** Run `init_schema.sql` on a free PostgreSQL instance (e.g., Supabase).
3.  **Intake:** Connect a Google Form to Jira via Zapier/Make for auto-ticket creation.

---

*Author: Elif Yetistiren*
