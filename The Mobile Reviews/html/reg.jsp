<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%



String TABLE_USERS="users";
String COLUMN_NAME="name";
String COLUMN_EMAILID="email";
PreparedStatement insertquery;
	
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String emailid=request.getParameter("email");
System.out.println(fname+emailid);
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testforjsp","root","shreyaskamath18sql");
String INSERT_USERS = "INSERT INTO " + TABLE_USERS +
'(' + COLUMN_NAME + ", " + COLUMN_EMAILID + ") VALUES(?, ?)";
insertquery=con.prepareStatement(INSERT_USERS,Statement.RETURN_GENERATED_KEYS);
insertquery.setString(1,fname);
insertquery.setString(2,emailid);

try
{
if((fname!=null && !fname.isEmpty())&&(emailid!=null && !emailid.isEmpty()))
{
int i=insertquery.executeUpdate();
if(i!=1)
{
System.out.println("not Inserted");	
}
else
{
	String site = new String("index.html");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location",site);
}
}
}catch(Exception e)
{
e.printStackTrace();	
}
%>
<script>
function success()
{
	
	}
</script>
</body>
</html>