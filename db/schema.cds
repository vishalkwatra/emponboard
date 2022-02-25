namespace employee.db;

entity Employees {
        @Common.Label :                    'UUID'
    key ID        : UUID;
        firstName : String @Common.Label : 'First Name';
        lastName  : String @(Common.Label : 'Name');
        country   : String @(Common.Label : 'Country');
        hireDate  : Date @(Common.Label : 'Hire Date');
        jobTitle  : String @(Common.Label : 'Job Title');
}
