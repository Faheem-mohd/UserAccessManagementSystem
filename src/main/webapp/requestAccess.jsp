<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.user.web.util.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/employee.css">
<title>Request Access</title>
<script type="text/javascript">
function showRequestForm(softwareId, softwareName) {
    document.getElementById('requestForm').style.display = 'block';
    document.getElementById('softwareList').style.display = 'none';
    document.getElementById('softwareId').value = softwareId;
    document.getElementById('softwareName').value = softwareName;
    document.getElementById('displaySoftwareName').innerText = softwareName;
}
function handleLogout(){
	window.location.href = 'login.jsp';
	alert("Logged out succcessfully");
}
</script>
</head>
<body>
	<nav class="nav-main">
    <div class="nav-left">
        <h1> User Access Management System </h1>
    </div>
    <div class="nav-right">
        <button onclick="handleLogout()">Logout</button>
    </div>
</nav>

	<main class="employee-main">
		<%
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId==null){
			response.sendRedirect("login.jsp");
			return;
		}
		String name = (String) session.getAttribute("name");
		%>
		
		<h1>Welcome <%= name %></h1>
		<div class="form-container">
		<div id="requestForm" style="display: none" class="employee-form">
			<form action="RequestServlet" method="post">
				<input type="hidden" id="softwareId" name="softwareId"> <input
					type="hidden" id="softwareName" name="softwareName"> <input
					type="hidden" id="userId" name="userId" value="<%=userId%>">
				<div>
					<label>Software Name:</label> <span  id="displaySoftwareName"></span>
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
				<div>
					<label for="reason">Reason :</label>
					<textarea id="reason" name="reason" required></textarea>

				</div>
				<input  class ="submit" type="submit" value="Request">
				<button
					onclick="document.getElementById('requestForm').style.display='none';
						document.getElementById('softwareList').style.display='block';">back</button>

			</form>
		</div>
		</div>
		<div class="employee-container-list">
		<div id="softwareList" class = "employee-list">
			<h2>Software List</h2>
			<table border="1">
				<tr>
					<th>Software Name</th>
					<th>Request</th>
				</tr>
				<%
				Connection c = null;
				PreparedStatement p = null;
				ResultSet rs = null;
				
				String sql = "SELECT s.id AS id, s.name AS name " + "FROM software s "
						+ "LEFT JOIN requests r ON r.software_id = s.id AND r.user_id = ? " + "WHERE r.id IS NULL;";

				try {
					c = Connect.getConnection();
					p = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					p.setInt(1, userId.intValue());
					rs = p.executeQuery();

					while (rs.next()) {
						int id = rs.getInt("id");
						String softwareName = rs.getString("name");
				%>
				<tr>
					<td><%=softwareName%></td>

					<td>
						<button onclick="showRequestForm(<%=id%>, '<%=softwareName%>')">Request
							Software</button>
					</td>
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
		</div>

	</main>
	<footer>
		<h2>Creator : Mohammed Faheem</h2>
	</footer>
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
/* Navigation Bar */
.nav-main {
    background: linear-gradient(135deg, #000000, #434343); /* Black gradient background */
    color: white; /* White text */
    padding: 25px; /* Padding around the text */
    display: flex;
    justify-content: space-between; /* Space out the content */
    align-items: center; /* Align items vertically */
    position: fixed;
    width: 100%; /* Full width */
    top: 0; /* Fix to the top of the page */
    z-index: 1000; /* Ensure it stays above other content */
}

.nav-left {
    flex: 1;
    text-align: left;
}

.nav-right {
    flex: 0;
    text-align: right;
}

.nav-main h1 {
    margin: 0; /* Remove default margin */
    font-size: 24px; /* Font size for the title */
    font-weight: bold; /* Make the header bold */
    text-transform: uppercase; /* Uppercase text for a bold effect */
}

.nav-main button {
    background-color: #4CAF50; /* Green background for buttons */
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 1rem;
}

.nav-main button:hover {
    background-color: #45a049; /* Darker green on hover */
}


/* Main Employee Section */
/* Main Employee Section */
.employee-main {
    margin-top: 80px; /* Give some space below the fixed navbar */
    padding: 20px;
    text-align: center; /* Center the welcome message */
}

/* Heading Styling */
.employee-main h1 {
    font-size: 30px; /* Larger font size for the heading */
    color: #333; /* Ensure text is visible */
    margin-top: 20px; /* Add some margin on top */
    font-weight: bold; /* Make the font bold */
}


/* Container styling for the form */
.form-container {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 30px;
    background-color: #f4f4f9;
}

/* Styling for the request form */
.employee-form {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    width: 100%;
}

/* Label styling */
.employee-form label {
    font-weight: bold;
    margin-top: 25px;
    margin-bottom: 10px;
    display: block;
}

/* Textarea styling */
.employee-form textarea {
    resize: vertical;
    height: 100px;
    width: 100%;
}

/* Radio button styling */
.employee-form input[type="radio"] {
    margin-right: 5px;
}

/* Inline display for radio options */
.employee-form div input[type="radio"] + label {
    display: inline-block;
    margin-right: 10px;
    font-weight: normal;
}

/* Styling for the submit and back buttons */
.employee-form .submit, 
.employee-form button {
    background-color: #4CAF50; /* Green gradient for buttons */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    margin-top: 15px;
}

.employee-form .submit:hover, 
.employee-form button:hover {
    background-color: #45a049; /* Darker green on hover */
}

/* Back button styling */
.employee-form button {
    background-color: #ccc;
    color: #333;
    margin-left: 10px;
}

.employee-form button:hover {
    background-color: #bbb;
}

/* Employee list styling */
.employee-container-list {
    display: flex;
    justify-content: center;
}

.employee-list {
    background-color: white;
    padding: 50px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto; /* Center the table */
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

/* Footer Styles */
footer {
    background: linear-gradient(135deg, #000000, #434343); /* Dark gradient for footer */
    color: white;
    text-align: center;
    padding: 10px 0;
    position: fixed;
    bottom: 0;
    width: 100%;
    font-size: 14px;
}

/* Submit Button Styling */
.submit {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
}

.submit:hover {
    background-color: #45a049;
}

/* Button styling */
button {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    border-radius: 5px;
}

button:hover {
    background-color: #0056b3;
}
</style>

