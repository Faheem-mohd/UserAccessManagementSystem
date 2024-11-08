<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.user.web.util.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager</title>
<link rel="stylesheet" href="styles/manager.css">
<script type="text/javascript">
function handleLogout(){
	window.location.href = 'login.jsp';
	alert("Logged out succcessfully");
}
</script>
</head>

<body>
	<nav class="nav-main">
		<div>
			<h1> User Access Management System </h1>
		</div>
		
		<div>
			<button onclick=handleLogout()>Logout</button>
		</div>
	</nav>
	<main class="manager-main">
	<%
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId==null){
			response.sendRedirect("login.jsp");
			return;
		}
		String name = (String) session.getAttribute("name");
		
		%>
		
		<h1>Hello <%= name %></h1>
		<div>
	<h2>Pending Requests List</h2>
	<%
	Connection c = null;
	PreparedStatement p = null;
	ResultSet rs = null;
	String sql = "SELECT r.id AS reqId, "
	           + "u.username AS employee_name, "
	           + "s.name AS software_name, "
	           + "r.access_type AS access_levels, "
	           + "r.reason AS reason "
	           + "FROM requests r "
	           + "JOIN users u ON r.user_id = u.id "
	           + "JOIN software s ON r.software_id = s.id "
	           + "WHERE r.status = 'Pending'";

	try {
		c = Connect.getConnection();
		p = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		rs = p.executeQuery();
		boolean hasNext = rs.next();
		if(!hasNext){	
	%>
		<h1 style="color:red; text-align: center;">No Pending requests</h1>
	<%
	} else {
	%>
		<table border="1">
			<tr>
				<th>Employee Name</th>
				<th>Software Name</th>
				<th>Access Type</th>
				<th>Reason</th>
				<th>Approve</th>
				<th>Reject</th>
			</tr>
		<%
		int count = 0;
		do {
			count++;
			int reqId = rs.getInt("reqId");
			String employeeName = rs.getString("employee_name");
			String softwareName = rs.getString("software_name");
			String reason = rs.getString("reason");
			String level = rs.getString("access_levels");
		%>
			<tr>
				<td><%=employeeName%></td>
				<td><%=softwareName%></td>
				<td><%=level%></td>
				<td><%=reason%></td>
				<td>
					<form action="ApprovalServlet" method="post">
						<input type="hidden" name="reqId" value="<%=reqId%>"> 
						<input type="hidden" name="action" value="Approved">
						<button type="submit">Approve</button>
					</form>
				</td>
				<td>
					<form action="ApprovalServlet" method="post">
						<input type="hidden" name="reqId" value="<%=reqId%>"> 
						<input type="hidden" name="action" value="Rejected">
						<button type="submit">Reject</button>
					</form>
				</td>
			</tr>
		<%
		} while (rs.next());
		%>
		</table>
	<%
	}
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} finally { 
		if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } 
		if (p != null) try { p.close(); } catch (SQLException e) { e.printStackTrace(); } 
		if (c != null) try { c.close(); } catch (SQLException e) { e.printStackTrace(); } 
	}
	%>
</div>

	</main>

</body>
</html>
<style>
/* Main Body Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    overflow: scroll;
}

/* Navigation Bar */
.nav-main {
    background: linear-gradient(135deg, #2e8b57, #006400); /* Green gradient background */
    color: white; /* White text */
    padding: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.nav-main h1 {
    margin: 0;
    font-size: 24px;
    font-weight: bold;
    text-transform: uppercase;
}

.nav-main button {
    background-color: #4CAF50; /* Green background for buttons */
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
}

.nav-main button:hover {
    background-color: #45a049; /* Darker green on hover */
}

/* Main Manager Section */
.manager-main {
    margin-top: 80px; /* Give some space below the fixed navbar */
    padding: 20px;
}

/* Form Container */
.form-container {
    margin-bottom: 20px;
    display: flex;
    justify-content: center;
}

/* Manager Form */
.manager-form {
    background-color: white;
    padding: 50px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Div styling inside the form */
.manager-form div {
    margin-bottom: 20px;
}

/* Manager List and Table */
.manager-container-list {
    display: flex;
    justify-content: center;
}

.manager-list {
    background-color: white;
    padding: 50px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Table Styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
}

th, td {
    padding: 10px 70px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f5f5f5;
}

/* Button Styling */
.submit {
    background-color: #4CAF50; /* Green gradient for buttons */
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
}

.submit:hover {
    background-color: #45a049; /* Darker green on hover */
}

button {
    background-color: #007BFF; /* Blue background for regular buttons */
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
}

button:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

/* Footer Styles */
footer {
    background: linear-gradient(135deg, #2e8b57, #006400); /* Green gradient for footer */
    color: white;
    text-align: center;
    padding: 10px 0;
    position: fixed;
    bottom: 0;
    width: 100%;
    font-size: 14px;
}
</style>
