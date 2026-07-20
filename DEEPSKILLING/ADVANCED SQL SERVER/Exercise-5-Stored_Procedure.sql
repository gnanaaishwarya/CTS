USE EmployeeManagement;
DELIMITER $$
CREATE PROCEDURE sp_CountEmployeesByDepartment(IN p_DepartmentID INT)
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employee
    WHERE DepartmentID = p_DepartmentID;
END $$
DELIMITER ;
CALL sp_CountEmployeesByDepartment(1);
CALL sp_CountEmployeesByDepartment(2);
CALL sp_CountEmployeesByDepartment(3);
