CREATE OR REPLACE TABLE appointments (
    appointment_id INT,
    patient_id INT,
    provider_id INT,
    appointment_datetime TIMESTAMP_LTZ,
    scheduled_datetime DATETIME,
    appointment_type VARCHAR(25),
    status VARCHAR(25),
    duration TIME
);

CREATE OR REPLACE TABLE patients (
    patient_id VARCHAR(50),
    name VARCHAR(50),
    dob DATE,
    gender VARCHAR(10),
    insurance_type VARCHAR(25),
    zip_code NUMBER,
    distance_to_clinic NUMBER,
    historical_no_show_rate NUMBER
);

CREATE OR REPLACE TABLE providers (
    provider_id INT,
    provider_name VARCHAR(30),
    specialty VARCHAR(25),
    sessions_per_week INT,
    avg_appointment_duration INT
);

CREATE OR REPLACE TABLE schedule_templates (
    provider_id INT,
    start_time TIME,
    slot_type VARCHAR(30),
    duration INT
);
