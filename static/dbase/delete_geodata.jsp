<%@ page import="java.sql.*" %>


       <%
	   
String driver = "org.postgresql.Driver";
String url = "jdbc:postgresql://127.0.0.1:5432/butuan_gis";
String username = "postgres";
String password = "admin";
Connection myConnection = null;
PreparedStatement myPreparedStatement = null;
ResultSet myResultSet = null;
Class.forName(driver).newInstance();
myConnection = DriverManager.getConnection(url,username,password);
Statement st;
ResultSet rs;
st = myConnection.createStatement();
            String query1 = "DELETE FROM bxu_data WHERE brgy LIKE '%"+request.getParameter("brgy")+"%' and year = "+request.getParameter("year")+";";
            int rowsAffected = st.executeUpdate(query1);
%>
[      
 {
"rowsAffected":"<%= rowsAffected %>"
 }
]