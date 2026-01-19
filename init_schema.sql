-- DCRM Project: Database Initialization Script
-- Description: Sets up the simulation environment with a 'System of Record' table 
-- containing intentional data quality errors for the project to fix.

-- 1. Clean up previous runs
DROP TABLE IF EXISTS sales_data;
DROP TABLE IF EXISTS remediation_log;

-- 2. Create the 'System of Record' Table (The table with issues)
CREATE TABLE sales_data (
    transaction_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    transaction_date DATE,
    product_category VARCHAR(50),
    revenue DECIMAL(10, 2),
    region VARCHAR(50)
);

-- 3. Create the Governance Log Table (To track fixes)
CREATE TABLE remediation_log (
    log_id SERIAL PRIMARY KEY,
    jira_ticket_ref VARCHAR(20),
    issue_type VARCHAR(50),
    impacted_table VARCHAR(50),
    records_affected INT,
    remediation_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    validation_status VARCHAR(20)
);

-- 4. Seed Data with Intentional Errors
-- Row 1-3: Good Data
INSERT INTO sales_data (customer_name, transaction_date, product_category, revenue, region)
VALUES 
('Acme Corp', '2025-10-01', 'SaaS', 15000.00, 'NA'),
('Globex', '2025-10-02', 'Consulting', 8500.00, 'EMEA'),
('Soylent Corp', '2025-10-03', 'Hardware', 12000.00, 'APAC');

-- Row 4: THE ERROR (Negative Revenue - Process Issue)
-- Scenario: User typed '-50000' instead of '50000'
INSERT INTO sales_data (customer_name, transaction_date, product_category, revenue, region)
VALUES 
('Initech', '2025-10-04', 'SaaS', -50000.00, 'NA'); 

-- Row 5: Another Error (Null Region - Data Quality Issue)
INSERT INTO sales_data (customer_name, transaction_date, product_category, revenue, region)
VALUES 
('Umbrella Corp', '2025-10-05', 'BioTech', 25000.00, NULL);