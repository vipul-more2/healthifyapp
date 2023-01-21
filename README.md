# healthifyapp
Web application created for Hospital to manage Patient Database and appointments

Database plays a key role in maintaining data of an application. Based on the application 
needs a database type is selected and designed. 
Scope of this application “Healthify” involves storing of information of doctors, patients and 
the appointments; this information is mostly textual and is related.
Considering these parameters we would be selecting and designing a Relational database.
MySQL database is used for the purpose of this application which is hosted on AWS cloud.
SQL Connection parameters used 
Server access url: ee417.crxkzf89o3fh.eu-west-1.rds.amazonaws.com:3306/testdb
Where testdb is the database name in which tables are created.
User credentials used 
 Username: ee417
 Password: ee417
The Interface between the java code and the database is created using jdbc drivers. These 
drivers help the application objects communicate with database in a language both understand 
and then based on the request by application a response is received from the database.
Since this application is hosted on tomcat server, the jar files are placed in the tomcat 
directory so that the configuration can access it easily.
Jar files used: 
 mysql-connector-java-8.0.27
 taglibs-standard-impl-1.2.5
 jstl-1.2
mysql-connector-java-8.0.27 : Provides connectivity between application with database using 
the JDBC API.
taglibs-standard-impl: Tag library, helps in providing a number of predefined actions that can 
be accessed and run on JSP pages directly. These actions involve accessing the database on 
the jsp page.
Jstl-1.2: Helps in conjuction with tag library, by providing conditioning tags for 
manipulation, wider document support to the application on the jsp page.
Database Schema
List of table used in the application: 
 20210696_patientform
 20210696_labmaster
 20210696_doctormaster
 20210696_diagnosismaster
Design Principles for Tables: 
 A 3NF third normal form is implemented for database design within the scope of this 
application. 
 All the rows within the database tables have unique values. 
 Presence of primary key for faster and efficient retrieval and data identification of 
records.
 Each column in the table has one unique value and does not contain multiple entries 
in one row of the same column.
Naming convention: 
 All the tables listed are transactional tables and save the main information for the 
objects individually hence are appended with the name master. 
 Also 20210696 which represents my student id, is added in order to identify the table 
more conveniently.
Data type selection for tables:
 All the primary key columns are having int datatype and is incremented by 1 for each 
row.
 Since it is marked as primary key no two rows can have the same value for the 
primary key.
 Parameters which would contain small text is defined with varchar(45) as the limit. 
 Fields which would be more descriptive are stored with varchar(255) datatype.
Scripts: 
Table creation for Patientform
CREATE TABLE `testdb`.`20210696_patientform` (
`firstname` varchar(255) DEFAULT NULL,
`lastname` varchar(255) DEFAULT NULL,
`email` varchar(255) DEFAULT NULL,
`ppsn` varchar(255) DEFAULT NULL,
`gender` varchar(25) DEFAULT NULL,
`employment` varchar(255) DEFAULT NULL,
`income` int DEFAULT NULL,
`age` int DEFAULT NULL,
`allergynote` varchar(255) DEFAULT NULL,
`Address` varchar(255) DEFAULT NULL,
`eircode` varchar(255) DEFAULT NULL,
`patientid` int NOT NULL AUTO_INCREMENT,
PRIMARY KEY (`patientid`)
)
Table creation for labmaster
CREATE TABLE `20210696_labmaster` (
`labid` int NOT NULL AUTO_INCREMENT,
`labname` varchar(45) DEFAULT NULL,
`category` varchar(45) DEFAULT NULL,
`description` varchar(155) DEFAULT NULL,
`accuracy` varchar(45) DEFAULT NULL,
`level` varchar(45) DEFAULT NULL,
`atr` varchar(45) DEFAULT NULL,
`specialnotes` varchar(255) DEFAULT NULL,
`createdby` varchar(45) DEFAULT NULL,
PRIMARY KEY (`labid`)
)
Table creation for doctormaster
CREATE TABLE `testdb`.`20210696_doctormaster` (
`doctorid` INT NOT NULL AUTO_INCREMENT,
`firstname` VARCHAR(45) NULL,
`lastname` VARCHAR(45) NULL,
`email` VARCHAR(45) NULL,
`ppsn` VARCHAR(45) NULL,
`gender` VARCHAR(45) NULL,
`services` VARCHAR(45) NULL,
`qualification` VARCHAR(45) NULL,
`Income` VARCHAR(45) NULL,
`Address` VARCHAR(45) NULL,
`Age` VARCHAR(45) NULL,
`eircode` VARCHAR(45) NULL,
`createdby` VARCHAR(45) NULL,
PRIMARY KEY (`doctorid`));
Table creation for DiagnosisMaster
CREATE TABLE `testdb`.`20210696_diagnosismaster` (
`diagnosisId` INT NOT NULL AUTO_INCREMENT,
`diagnosisname` VARCHAR(45) NULL,
`diagnosisCategory` VARCHAR(45) NULL,
`diagnosisDescription` VARCHAR(45) NULL,
`Severity` VARCHAR(45) NULL,
`requirement` VARCHAR(45) NULL,
`levelofassessment` VARCHAR(45) NULL,
`AdditionalTest` VARCHAR(45) NULL,
`SpecialNotes` VARCHAR(45) NULL,
PRIMARY KEY (`diagnosisId`));
Advanced Queries 
Indexing on 20210696_patientform: 
By default mysql creates Indexes on primary key, which is used to access the row 
information when a query is run. However not always primary keys are used for searching 
across a table. In this application, the application requests information using the firstname 
hence an index on the firstname column is created using below script, which helps in faster 
retrieval of data.
create index firstname_indexing
on testdb.20210696_patientform(firstname);
Unique Entries: Using the unique index on the table 20210696_labmaster we are making 
sure that the combination of row values of labname and category are unique and are not 
repetitive and thus avoiding data redundancy.
create unique index labvalidator
on testdb.20210696_labmaster(labname, category);
Information in table with minimum 5 entries
All the entries above are added using the application.
PART B: Servlets for Data Insertion in RDBMS using JDBC
Functional overview: The jsp pages are launched which takes in the user input after front 
end validation of the data. The data is then passed to servlet pages giving another option to 
edit and verify the data, if pressed submit it goes to another servlet pages displaying the 
confirmation and a database entry is made.
Implementation:
1) Quick Access >> Create Patient 
Enter the details for the patient to be created, patientform.jsp accepts the information
2) Once the information is filled, click on create which would then transfer the 
information to Patientform.java servlet which stores the information in database
3) The page is then redirected to Patientformcookie.java which fetches the stored 
information from database by querying the firstname entered for the record and 
displays the results. 
4) Newly added record 
Key Code:
Inorder to insert the information into database a call from the servlet page needs to be made 
to the database using JDBC.
For the purpose of simplicity and code reusability “databaseconnection.java” file is created.
A connection is established and the url, username and password is defined in the Driver 
Manager which helps in establishing the connection.
Below code is used to make the call to the database from the PatientForm.java
databaseconnection.createconnection(firstname,lastname,email,ppsn,gender,em
ployment,income,age,allergynote,Address,eircode);
The parameters from the form are passed here and accessed and stored in a variable. These 
variables are then passed to the function createconnection().
The function createconnection(), after establishment of connection using the Driver manager
generates the input string. 
Here the insert statement has column name defined and then in the values part ? is used to 
pass the parameters.
An object of PreparedStatement class is used to pass through the connection and then it is 
passed with the insert query. ps.setString() or ps.setInt( ) based on the data type of the field is 
used to pass parameters into the insert query.
After setting the values, the query is executed using the ps.execute command and the 
connection is closed subsequently.
A connection close request is to be made so that there is no overhead over the network and no 
overload on the application and database in terms of request and response.
public static void createconnection(String firstname, String lastname,String
email, String ppsn, String gender,String employment,String income, String
age,String allergynote, String Address,String eircode) {
try ( Connection conn = DriverManager.getConnection(url, username, 
password)){
System.out.println("Connected");
System.out.println(firstname);
String insertnewpatient = "insert into 
testdb.20210696_patientform (firstname, lastname, email, ppsn, gender, 
employment, income, age, allergynote, Address, eircode)"
+ " values (?,?,?,?,?,?,?,?,?,?,?)";
int age_int = Integer.parseInt(age);
int income_int = Integer.parseInt(income);
PreparedStatement ps = 
conn.prepareStatement(insertnewpatient);
ps.setString(1,firstname); 
ps.setString(2,lastname); 
ps.setString(3,email);
ps.setString(4,ppsn);
ps.setString(5,gender);
ps.setString(6,employment);
ps.setInt(7,income_int);
ps.setInt(8,age_int);
ps.setString(9,allergynote);
ps.setString(10,Address);
ps.setString(11,eircode);
ps.execute();
conn.close();
}catch(SQLException e) {
System.out.println("Opps");
e.printStackTrace();
}
Once the value is inserted successfully, the application then retrieves it and displays it to the 
user using the below logic which retrieves the information from the database of the entered 
patient details.
Patientformcookie.java servlet page implements the page wherein it uses prepared statement 
and sends the batch of query with a where claue wherein the firstname is passed into the 
query, which fetches the record for the same entry.
PreparedStatement ps = conn.prepareStatement("SELECT * FROM 
20210696_patientform where firstname = ?");
ps.setString(1,firstname_val);
In-order to load the data into the servlet a ResultSet is used which stores the retrieved 
information from the database into a ResultSet variable “rs”. Running a while loop, the code 
iterates over the result set and assigns the value in to variable. These variables are then used 
to display information in the table.
while(rs.next()) { 
int age_ = rs.getInt("age"); 
age= Integer.toString(age_);
lastname = rs.getString("lastname");
firstname = rs.getString("firstname");
email = rs.getString("email");
Address = rs.getString("Address");
ppsn= rs.getString("ppsn");
gender= rs.getString("gender");
employment= rs.getString("employment");
income= rs.getString("income");
allergynote= rs.getString("allergynote");
eircode= rs.getString("eircode");
Navigate to Side Menu Bar >> Patient Admin >> Historical Data >> Patient List Entry
The Historicaldata.jsp calls listofPatient.java servlet which displays the entire list of patients 
available in the dataset.
Below code is used as insert query
PreparedStatement ps = conn.prepareStatement("SELECT * FROM 
20210696_patientform");
rs = ps.executeQuery();
Inorder to make the table dynamic below code is executed in the table row section which
makes the table dynamic and will expand till the last row.
out.println("<tr><td>" + rs.getString("firstname") + "</td>");
out.println("<td>" + rs.getString("lastname") + "</td>");
out.println("<td>" + rs.getString("email") + "</td>");
out.println("<td>" + rs.getString("ppsn") + "</td>");
out.println("<td>" + rs.getString("gender") + "</td>");
out.println("<td>" + rs.getString("employment") + "</td>");
out.println("<td>" + rs.getString("income") + "</td>");
out.println("<td>" + rs.getString("age") + "</td>");
out.println("<td>" + rs.getString("allergynote") + "</td>");
out.println("<td>" + rs.getString("Address") + "</td>");
out.println("<td>" + rs.getString("eircode") + "</td>");
out.println("</tr>");
PART C: Display Data from Database in JSP Pages
JSP tags are used to communicate with design pages and also communicate with database 
using additional tags and library files.
Implementation: 
Below listed libraries need to be imported into the page for embedding the tags
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
Menu Bar >> Set up >> Lab Master Screen
When the LabScreen.jsp is loaded, it launches the jsp page with preloaded data and displays 
the information on load.
The tags initialize and fetch the sql connection. The data is then stored in a result variable. 
Within the sql query tag, the data-source is defined then the variable in which the information 
is stored and the query to be executed is written within the tags.
<sql:query dataSource = "${snapshot}" var = "result">
SELECT * FROM testdb.20210696_patientform </sql:query>
Variable snapshot stores the information about the datasource using below code
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://ee417.crxkzf89o3fh.eu-west1.rds.amazonaws.com:3306/testdb"
user = "ee417" password = "ee417"/>
The variable result is now iterated for each row using a loop and then using jquery each row 
is presented in the appropriate cells in a html table using below table
</tr>
<c:forEach var = "row" items = "${result.rows}">
<tr>
<td><c:out value = "${row.firstname}"/></td>
<td><c:out value = "${row.lastname}"/></td>
<td><c:out value = "${row.email}"/></td>
<td><c:out value = "${row.gender}"/></td>
<td><c:out value = "${row.ppsn}"/></td>
<td><c:out value = "${row.employment}"/></td>
<td><c:out value = "${row.income}"/></td>
<td><c:out value = "${row.age}"/></td>
<td><c:out value = "${row.allergynote}"/></td>
<td><c:out value = "${row.Address}"/></td>
<td><c:out value = "${row.eircode}"/></td>
</tr>
</c:forEach>
Output on screen
Side Navigation Bar >> Patient Admin >> Historical Data >> Doctor List
These tabs display list of all entries for the selected object. 
Queries used for 
Doctor List : SELECT * FROM testdb.20210696_doctormaster
When we click on Doctor List below output is displayed
Lab List: SELECT * FROM testdb.20210696_labmaster
When we click on Lab List below output is displayed
Summary table 
Page Feature Page type – embedded with 
DB
Labscreen Insert , Retrieve Jsp and Servlet
Doctor Registration Validate and Insert Jsp and Servlet
Patient form Insert and Retrieve Servlet
Historical Data 
Doctor List
Lab List 
Retrieve
Retrieve
JSP
JSP
Historical Data 
Patient List Retrieve Servlet
