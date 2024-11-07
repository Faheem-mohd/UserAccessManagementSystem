<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.user.web.util.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Software Creation</title>
<link rel="stylesheet" href="styles/admin.css">
<script type="text/javascript">

function handleLogout() {
    window.location.href = 'login.jsp';
    alert("Logged out succcessfully");
}



</script>
</head>
<body>
	<nav class="nav-main">
		<div>
			<h1>User Access Management System</h1>
		</div>
		<div>
			<button style="background-color: #ff4d4d;
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;" onclick=handleLogout()>Logout</button>
		</div>
	</nav>

	<main class="admin-main">
	
	<%
		
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId==null){
			response.sendRedirect("login.jsp");
			return;
		}
		String name = (String) session.getAttribute("name");
		%>
		
		<h1>Welcome <%= name %></h1>
		<div class="button-container">
			<button class="admin-create"
				onclick="document.getElementById('createForm').style.display='block';
                 document.getElementById('softwareList').style.display='none';">
				Create Software</button>
		</div>

		<div id="createForm" style="display: none;" class="admin-form">
			<form action="SoftwareServlet" method="post">
				<div>
					<%
					String errorMessage = request.getParameter("error");
					if (errorMessage != null) {
					%>
					<div style="color: red;">
						<%=errorMessage%>
					</div>
					<%
					}
					%>
					<div>
						<label for="softwareName">Enter your Software Name:</label> <input
							type="text" id="softwareName" name="softwareName" required>
					</div>
					<div>
						<label for="description">Description:</label>
						<textarea id="description" name="description" required></textarea>

					</div>
					<div>
						<label for="levels">Choose Access level:</label> <input
							type="radio" id="level_read" name="level" value="Read" checked>
						<label for="level_read">Read</label> <input type="radio"
							id="level_write" name="level" value="Write"> <label
							for="level_write">Write</label> <input type="radio"
							id="level_admin" name="level" value="Admin"> <label
							for="level_admin">Admin</label>
					</div>

					<input class="submit" type="submit" value="Create">

					<button
						onclick="document.getElementById('createForm').style.display='none';
						document.getElementById('softwareList').style.display='block';">back</button>
				</div>
			</form>
		</div>

		<div id="softwareList" class="admin-list">
			<h2>Software List</h2>
			<table border="1">
				<tr>
					<th>Software Name</th>
					<th>Description</th>
					<th>Access Level</th>
				</tr>
				<%
				Connection c = null;
				PreparedStatement p = null;
				ResultSet rs = null;
				String sql = "SELECT name , description , access_levels FROM software ";

				try {
					c = Connect.getConnection();
					p = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					rs = p.executeQuery();
					while (rs.next()) {
						String softwareName = rs.getString("name");
						String description = rs.getString("description");
						String level = rs.getString("access_levels");
				%>
				<tr>
					<td><%=softwareName%></td>
					<td><%=description%></td>
					<td><%=level%></td>
				</tr>
				<%
				}
				} catch (SQLException e) {
				e.printStackTrace();
				} catch (ClassNotFoundException e) {
				e.printStackTrace();
				} finally {
				if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (p != null)
				try {
					p.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (c != null)
				try {
					c.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				}
				%>
			</table>


		</div>
	</main>
<footer>
		<h2 style="color:white;">Creator : Mohammed Faheem</h2>
	</footer>

</body>
</html>

<style>
@charset "UTF-8";
/* General Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #000000, #434343); /* Dark gradient for background */
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    overflow-y: auto; /* Ensures the page can scroll vertically */
}

h1, h2 {
    color: #fff; /* White text for headings */
}

nav.nav-main {
    background: linear-gradient(135deg, #000000, #434343); /* Dark gradient for nav */
    padding: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
}

nav.nav-main h1 {
    margin: 0;
    color: white;
}

.submit , button {
    padding: 8px 16px;
    background-color: #45a049; /* Consistent green for buttons */
    border: none;
    color: white;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #367a36; /* Darker green on hover */
}

.admin-main {
    margin: 20px;
}

.button-container {
    display: flex;
    justify-content: flex-end; /* Aligns content to the right */
    padding: 10px; /* Optional padding for spacing */
}

.admin-create {
    background-color: #4CAF50; /* Green background */
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.admin-create:hover {
    background-color: #45a049; /* Darker green on hover */
}


/* Form Styles */
.admin-form {
    position: relative;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    min-width: 600px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    margin-bottom: 70px;
}

.admin-form div {
    margin-bottom: 15px;
}

.admin-form label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.admin-form input[type="text"],
.admin-form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.admin-form textarea {
    resize: vertical;
    height: 100px;
}

.admin-form div.radio-group {
    display: flex;
    align-items: center;
    gap: 10px; /* Space between radio buttons */
}

.admin-form input[type="radio"] {
    margin-right: 5px; /* Space between radio button and label */
}

.admin-form label[for^="level"] {
    display: inline-block;
    margin: 0;
}

.admin-form input[type="submit"],
.admin-form button {
    margin-top: 10px;
}

/* Table Styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
    text-align: left;
}

th, td {
    padding: 12px;
}

th {
    background-color: #4CAF50; /* Green for table headers */
    color: white;
}

td {
    background-color: #f9f9f9; /* Light gray background for table rows */
}

tr:nth-child(even) td {
    background-color: #f2f2f2; /* Alternating row color */
}

tr:hover td {
    background-color: #ddd; /* Hover effect for rows */
}

/* Footer Styles */
footer {
    background: linear-gradient(135deg, #000000, #434343); /* Dark gradient for footer */
    color: white;
    text-align: center;
    padding: 10px 0;
    margin-top: auto; /* Push the footer to the bottom */
    width: 100%;
}
</style>
