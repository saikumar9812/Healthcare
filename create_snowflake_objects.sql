USE ROLE SECURITYADMIN;

CREATE ROLE cortex_user_role;
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE cortex_user_role;

-- Replace <your_user> with your username
GRANT ROLE cortex_user_role TO USER saikumar98125;

USE ROLE sysadmin;

CREATE OR REPLACE DATABASE cortex_analyst_demo;
CREATE OR REPLACE SCHEMA cortex_analyst_demo.healthcare;

CREATE OR REPLACE WAREHOUSE cortex_analyst_wh
    WAREHOUSE_SIZE = 'large'
    WAREHOUSE_TYPE = 'standard'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for Cortex Analyst demo';

GRANT USAGE ON WAREHOUSE cortex_analyst_wh TO ROLE cortex_user_role;
GRANT OPERATE ON WAREHOUSE cortex_analyst_wh TO ROLE cortex_user_role;

GRANT OWNERSHIP ON SCHEMA cortex_analyst_demo.healthcare TO ROLE cortex_user_role;
GRANT OWNERSHIP ON DATABASE cortex_analyst_demo TO ROLE cortex_user_role;

USE ROLE cortex_user_role;
USE WAREHOUSE cortex_analyst_wh;
USE DATABASE cortex_analyst_demo;
USE SCHEMA cortex_analyst_demo.healthcare;

CREATE OR REPLACE STAGE raw_data DIRECTORY = (ENABLE = TRUE);
