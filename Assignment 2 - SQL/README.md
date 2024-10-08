# Assignment 3

## Scenario:

- I'm running a Dog Groomers called 'TGroomers' and I have created a database to manage my appointment bookings.
- I have created 5 tables to do this:
1. appointments
2. clientList
3. groomers
4. multipleServiceAppointments (junction table)
5. servicesList

All of my tables, except number 4 have data inserted into them. All of them have PK and FKs.
I was intending to use the junction table to house the info used to CALL my stored procedure.

*I have also added to the Assignment 3 directory my 'database table plans' xlsx which shows the planning of my tables and the mock data in line with the planned tables and defined data types.*

### Queries:
- I used ALTER to add the UNIQUE CONSTRAINT to my client email address column. 
- I wrote various queries to INSERT into my tables.
- I wrote 2 queries to UPDATE my groomers availability and clients email address.
- I used 2 JOINS to work out my earnings for 2024 and review my top clients.  

### Stored Procedure:
My stored procedure intends to improve the functionality of my booking system wherein clients could book multiple 
services in one appointment so that it was more realistic and dynamic.


**Note:**

I have made comments throughout and haven't commented out any of my queries bar the CREATE DB and USE DB one's because I
otherwise found it very confusing. I was running the queries by the line as opposed to all at once. 

I hope this is ok. I just really struggle to read and follow SQL comments.
