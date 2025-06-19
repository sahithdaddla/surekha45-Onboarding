


CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    personal_details JSONB NOT NULL,
    bank_details JSONB,
    id_uploads JSONB,
    is_fresher BOOLEAN DEFAULT FALSE,
    status VARCHAR(20) DEFAULT 'Pending' CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    progress INTEGER DEFAULT 0 CHECK (progress >= 0 AND progress <= 100),
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(255) NOT NULL
);


CREATE TABLE educational_details (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
    education_type VARCHAR(50) NOT NULL,
    institution_name VARCHAR(255) NOT NULL,
    branch VARCHAR(100),
    passout_year INTEGER NOT NULL,
    percentage NUMERIC(5,2) NOT NULL,
    location VARCHAR(255) NOT NULL,
    certificate JSONB
);


CREATE TABLE previous_employment (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
    company_name VARCHAR(255) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    experience NUMERIC(5,1) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    location VARCHAR(255) NOT NULL,
    relieving_letter JSONB,
    experience_letter JSONB
);

