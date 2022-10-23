-- Syntax:
-- CREATE TABLE table_name( col_name DATA_TYPE, ...)
-- table_name - all lowercase in singular form

-- Create the car table
CREATE TABLE car(
	-- column_name DATATYPE <CONSTRAINTS>,
	car_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	make VARCHAR(50) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	model VARCHAR(50) NOT NULL,
	model_year VARCHAR(4),
	color VARCHAR(10)
);

SELECT *
FROM car;

-- Create the customer table
CREATE TABLE customer(
	-- column_name DATATYPE <CONSTRAINTS>,
	customer_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	first_name VARCHAR(25) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	last_name VARCHAR(25) NOT NULL,
	phone_num VARCHAR (20),
	email_address VARCHAR(50),
	car_id INTEGER,
	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

SELECT *
FROM customer;

-- Create the mechanic table 
CREATE TABLE mechanic(
	-- column_name DATATYPE <CONSTRAINTS>,
	mechanic_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	first_name VARCHAR(25) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	last_name VARCHAR(25) NOT NULL,
	phone_num VARCHAR(25),
	email_address VARCHAR(50)

);

SELECT *
FROM mechanic;

CREATE TABLE service_history(
	-- column_name DATATYPE <CONSTRAINTS>,
	service_ticket_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	service_date VARCHAR(10) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	customer_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id)

);

SELECT *
FROM service_history;

-- Create the salesperson table
CREATE TABLE salesperson(
	-- column_name DATATYPE <CONSTRAINTS>,
	employee_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	first_name VARCHAR(25) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	last_name VARCHAR(25) NOT NULL,
	phone_num VARCHAR(25),
	email_address VARCHAR(25)
);
-- View table 
SELECT *
FROM salesperson;

-- Create the purchase history table
CREATE TABLE purchase_history(
	-- column_name DATATYPE <CONSTRAINTS>,
	invoice_num SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	purchase_date VARCHAR(10) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	car_id INTEGER NOT NULL,
	employee_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(employee_id) REFERENCES salesperson(employee_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

SELECT *
FROM purchase_history;
