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
//ResultSet rs;
st = myConnection.createStatement();

String query1 = "INSERT INTO bxu_data (id, brgy, population, employed, unemployed, underemployed, hectares, sqkm, year, class) "
        + "VALUES ("+request.getParameter("id")+", '"+request.getParameter("brgy")+"', "+request.getParameter("population")+", "+request.getParameter("employed")+", "+request.getParameter("unemployed")+", "+request.getParameter("underemployed")+", "
        + ""+request.getParameter("hectares")+", "+request.getParameter("sqkm")+", "+request.getParameter("year")+", '"+request.getParameter("class")+"');";
int rows = st.executeUpdate(query1);
myConnection.close();
String success = "";
if(rows > 0){
    success = "True";
}else{
    success = "False";
}
       %>
[
    {
        "success":"<%= success %>"
    }
]
