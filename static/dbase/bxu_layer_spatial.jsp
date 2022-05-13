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
//         String query  = "SELECT "+request.getParameter("parameter")+", brgy, st_asgeojson(ST_Simplify(geom, 0.0007)), sqkm FROM bxu_data WHERE year = "+request.getParameter("year")+" ";
           String query = "SELECT dyn."+request.getParameter("parameter")+" as "+request.getParameter("parameter")+", stat.brgy as brgy, st_asgeojson(ST_Simplify(geom, 0.0007)), stat.sqkm as sqkm FROM static_table as stat, dynamic_table as dyn WHERE dyn.year = "+request.getParameter("year")+" AND stat.brgy = dyn.brgy; ";
//           String query = "SELECT dyn.population as pop, dyn.employed as emp, dyn.unemployed as unemp, dyn.underemployed as under, stat.brgy as brgy, st_asgeojson(ST_Simplify(geom, 0.0007)), stat.sqkm as sqkm FROM static_table as stat, dynamic_table as dyn WHERE dyn.year = "+request.getParameter("year")+" AND stat.brgy = dyn.brgy; ";

>>>>>>> f64c8d7... [GIS-038] - Relational database update
          rs = st.executeQuery(query) ;
		ResultSetMetaData  meta = rs.getMetaData();
Integer columncount = meta.getColumnCount();
       %>
{"type":"FeatureCollection",
    "features":[
        <% while(rs.next()){ %>
	{"type":"Feature",
         "geometry":<%= rs.getString("st_asgeojson")%>,
         "properties":{
            <% for (int i = 1 ; i<=columncount; i++)
            {
            if(!meta.getColumnName(i).equals("st_asgeojson"))
                {
            %>
            <% if (i>1){%>,<% } %>
            "<%= meta.getColumnName(i)%>":"<%= rs.getString(meta.getColumnName(i))%>"
        <% }} %>
    }}
    
    <% if (!rs.isLast()){%>,<% } %>
    <% } %>
]}
	 
     
   

