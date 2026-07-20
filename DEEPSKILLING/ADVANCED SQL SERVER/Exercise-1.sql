CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;
CREATE TABLE Department(
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(100)
);
CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
INSERT INTO Department(DepartmentID, DepartmentName)
VALUES
(1, 'Human Resources'),
(2, 'Information Technology'),
(3, 'Finance'),
(4, 'Marketing');
INSERT INTO Employee
(EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate)
VALUES
(101, 'John', 'Doe', 1, 45000.00, '2023-01-10'),
(102, 'Alice', 'Smith', 2, 60000.00, '2022-05-15'),
(103, 'David', 'Johnson', 3, 55000.00, '2021-09-20'),
(104, 'Emily', 'Brown', 2, 70000.00, '2020-07-01');

DELIMITER $$

CREATE PROCEDURE sp_GetEmployeesByDepartment(IN p_DepartmentID INT)
BEGIN
    SELECT *
    FROM Employee
    WHERE DepartmentID = p_DepartmentID;
END $$

DELIMITER ;

-- Execute Procedure
CALL sp_GetEmployeesByDepartment(2);

-- Stored Procedure to Insert Employee
DELIMITER $$

CREATE PROCEDURE sp_InsertEmployee(
    IN p_EmployeeID INT,
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_DepartmentID INT,
    IN p_Salary DECIMAL(10,2),
    IN p_JoinDate DATE
)
BEGIN
    INSERT INTO Employee
    (EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES
    (p_EmployeeID, p_FirstName, p_LastName, p_DepartmentID, p_Salary, p_JoinDate);
END $$

DELIMITER ;

CALL sp_InsertEmployee(
    105,
    'Michael',
    'Taylor',
    1,
    65000.00,
    '2024-02-15'
);

SELECT * FROM Employee;
