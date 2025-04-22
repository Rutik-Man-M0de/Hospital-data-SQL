SELECT * FROM hospital_data;

--Total Number of Patients 
-- Write an SQL query to find the total number of patients across all hospitals. 
SELECT hospital_name, SUM(patients_count) AS total_no_patients
FROM hospital_data
GROUP BY hospital_name;


-- Average Number of Doctors per Hospital 
-- Retrieve the average count of doctors available in each hospital. 
SELECT hospital_name, AVG(doctors_count) AS avg_doctors_count
FROM hospital_data
GROUP BY hospital_name;

--Top 3 Departments with the Highest Number of Patients 
--Find the top 3 hospital departments that have the highest number of patients. 
SELECT department, SUM(patients_count) highest_patients
FROM hospital_data
GROUP BY department 
ORDER BY highest_patients DESC LIMIT 3;


--Hospital with the Maximum Medical Expenses 
--Identify the hospital that recorded the highest medical expenses. 
SELECT * FROM hospital_data
ORDER BY medical_expenses DESC LIMIT 1;


--Daily Average Medical Expenses 
--Calculate the average medical expenses per day for each hospital. 
SELECT hospital_name,
AVG(medical_expenses / COALESCE(NULLIF(DATE(discharge_date) - DATE(admission_date), 0), 1)) 
AS avg_medical_expenses
FROM hospital_data
GROUP BY hospital_name;


--Longest Hospital Stay 
--Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT hospital_name, admission_date, discharge_date,
       discharge_date - admission_date AS day_of_stay
FROM hospital_data
ORDER BY day_of_stay DESC
LIMIT 1;


--Total Patients Treated Per City 
--Count the total number of patients treated in each city. 
SELECT location, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY location;


-- Average Length of Stay Per Department 
--Calculate the average number of days patients spend in each department. 
SELECT department, AVG(discharge_date-admission_date) AS avg_day_patients_stay
FROM hospital_data
GROUP BY department;


--Identify the Department with the Lowest Number of Patients 
--Find the department with the least number of patients. 
SELECT department, SUM(patients_count) AS least_patients
FROM hospital_data
GROUP BY department
ORDER BY least_patients LIMIT 1; 


--Monthly Medical Expenses Report 
--Group the data by month and calculate the total medical expenses for each month. 
SELECT 
    EXTRACT(MONTH FROM admission_date) AS month,
    SUM(medical_expenses) AS total_medical_expenses
FROM hospital_data
GROUP BY month
ORDER BY month;

