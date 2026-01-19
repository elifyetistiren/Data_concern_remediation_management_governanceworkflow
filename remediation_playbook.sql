-- DCRM Project: Remediation & Validation Runbook
-- Description: Queries used to identify, fix, and validate data issues.

-- ==========================================
-- TICKET: DCRM-1 (Negative Revenue Fix)
-- ==========================================

-- STEP 1: ASSESSMENT (Identify the bad rows)
-- Goal: Find transactions with negative revenue
SELECT * FROM sales_data 
WHERE revenue < 0;

-- STEP 2: REMEDIATION (Apply the fix)
-- Goal: Correct the manual entry error for Initech
UPDATE sales_data 
SET revenue = 50000.00 
WHERE transaction_id = 4 AND revenue = -50000.00;

-- STEP 3: LOGGING (Audit trail)
-- Goal: Record the fix in the governance log
INSERT INTO remediation_log (jira_ticket_ref, issue_type, impacted_table, records_affected, validation_status)
VALUES ('DCRM-1', 'Data Accuracy', 'sales_data', 1, 'PENDING_VAL');

-- STEP 4: VALIDATION (The "Proof")
-- Goal: Prove that no negative values remain. Result must be 0.
SELECT count(*) as validation_error_count 
FROM sales_data 
WHERE revenue < 0;


-- ==========================================
-- TICKET: DCRM-2 (Missing Region Fix)
-- ==========================================

-- STEP 1: ASSESSMENT
SELECT * FROM sales_data WHERE region IS NULL;

-- STEP 2: REMEDIATION
-- Goal: Set default region for Umbrella Corp based on HQ location
UPDATE sales_data 
SET region = 'NA' 
WHERE customer_name = 'Umbrella Corp' AND region IS NULL;

-- STEP 3: VALIDATION
SELECT count(*) as validation_error_count 
FROM sales_data 
WHERE region IS NULL;