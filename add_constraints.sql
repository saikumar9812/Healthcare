ALTER TABLE cortex_analyst_demo.healthcare.appointments
ADD CONSTRAINT pk_app_hc PRIMARY KEY (appointment_id);

ALTER TABLE cortex_analyst_demo.healthcare.patients
ADD CONSTRAINT pk_patients_hc PRIMARY KEY (patient_id);

ALTER TABLE cortex_analyst_demo.healthcare.providers
ADD CONSTRAINT pk_providers PRIMARY KEY (provider_id);

ALTER TABLE cortex_analyst_demo.healthcare.appointments
ADD CONSTRAINT pid_fk_app
FOREIGN KEY (patient_id)
REFERENCES cortex_analyst_demo.healthcare.patients (patient_id);

ALTER TABLE cortex_analyst_demo.healthcare.appointments
ADD CONSTRAINT provid_fk_app
FOREIGN KEY (provider_id)
REFERENCES cortex_analyst_demo.healthcare.providers (provider_id);

ALTER TABLE cortex_analyst_demo.healthcare.schedule_templates
ADD CONSTRAINT provid_fk_sch
FOREIGN KEY (provider_id)
REFERENCES cortex_analyst_demo.healthcare.providers (provider_id);