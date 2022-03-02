using {employee.db as db} from '../db/schema';

service EmployeeService @(requires : 'authenticated-user'){
    entity Employees as projection on db.Employees;
}