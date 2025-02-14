USE ROLE cortex_user_role;
USE DATABASE cortex_analyst_demo;
USE SCHEMA cortex_analyst_demo.healthcare;
USE WAREHOUSE cortex_analyst_wh;

COPY INTO cortex_analyst_demo.healthcare.appointments
FROM @raw_data
FILES = ('appointments.csv.gz')
FILE_FORMAT = (
    TYPE=CSV,
    COMPRESSION=GZIP,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=FALSE,
    FIELD_OPTIONALLY_ENCLOSED_BY=NONE,
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO,
    EMPTY_FIELD_AS_NULL = FALSE,
    ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE
)
ON_ERROR=CONTINUE
FORCE = TRUE;

COPY INTO cortex_analyst_demo.healthcare.patients
FROM @raw_data
FILES = ('patients.csv.gz')
FILE_FORMAT = (
    TYPE=CSV,
    COMPRESSION=GZIP,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=FALSE,
    FIELD_OPTIONALLY_ENCLOSED_BY=NONE,
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO,
    EMPTY_FIELD_AS_NULL = FALSE,
    ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE
)
ON_ERROR=CONTINUE
FORCE = TRUE;

COPY INTO cortex_analyst_demo.healthcare.providers
FROM @raw_data
FILES = ('providers.csv.gz')
FILE_FORMAT = (
    TYPE=CSV,
    COMPRESSION=GZIP,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=FALSE,
    FIELD_OPTIONALLY_ENCLOSED_BY=NONE,
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO,
    EMPTY_FIELD_AS_NULL = FALSE,
    ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE
)
ON_ERROR=CONTINUE
FORCE = TRUE;

COPY INTO cortex_analyst_demo.healthcare.schedule_templates
FROM @raw_data
FILES = ('schedule_templates.csv.gz')
FILE_FORMAT = (
    TYPE=CSV,
    COMPRESSION=GZIP,
    SKIP_HEADER=1,
    FIELD_DELIMITER=',',
    TRIM_SPACE=FALSE,
    FIELD_OPTIONALLY_ENCLOSED_BY=NONE,
    REPLACE_INVALID_CHARACTERS=TRUE,
    DATE_FORMAT=AUTO,
    TIME_FORMAT=AUTO,
    TIMESTAMP_FORMAT=AUTO,
    EMPTY_FIELD_AS_NULL = FALSE,
    ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE
)
ON_ERROR=CONTINUE
FORCE = TRUE;

-- Upload appointments.csv
-- Upload appointments.csv
PUT file://C:/Users/SaiKumarReddyKatika/Downloads/sfguide-getting-started-with-cortex-analyst-main/sfguide-getting-started-with-cortex-analyst-main/appointments.csv @raw_data;

-- Upload patients.csv
PUT file://C:/Users/SaiKumarReddyKatika/Downloads/sfguide-getting-started-with-cortex-analyst-main/sfguide-getting-started-with-cortex-analyst-main/patients.csv @raw_data;

-- Upload providers.csv
PUT file://C:/Users/SaiKumarReddyKatika/Downloads/sfguide-getting-started-with-cortex-analyst-main/sfguide-getting-started-with-cortex-analyst-main/providers.csv @raw_data;

-- Upload schedule_templates.csv
PUT file://C:/Users/SaiKumarReddyKatika/Downloads/sfguide-getting-started-with-cortex-analyst-main/sfguide-getting-started-with-cortex-analyst-main/schedule_templates.csv @raw_data;

LIST @raw_data;


SHOW STAGES IN SCHEMA CORTEX_ANALYST_DEMO.HEALTHCARE;
GRANT READ ON STAGE CORTEX_ANALYST_DEMO.HEALTHCARE.RAW_DATA TO ROLE cortex_user_role;
GRANT WRITE ON STAGE CORTEX_ANALYST_DEMO.HEALTHCARE.RAW_DATA TO ROLE cortex_user_role;

SHOW GRANTS ON STAGE CORTEX_ANALYST_DEMO.HEALTHCARE.RAW_DATA;
