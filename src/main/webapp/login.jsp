<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>User Access Management</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/nav.css">
<link rel="stylesheet" href="styles/login.css">
</head>
<body>
	<nav class="nav-main">
		<h1>User Access Management System</h1>
	</nav>

	<main class="login-main">
		<form action="loginServlet" method="post" class="login-form">
			<div class="login-container">
				<h2>Welcome</h2>
				<%
				String errorMessage = request.getParameter("error");
				if (errorMessage != null) {
				%>
				<div style="color: red; text-align: center">
					<%=errorMessage%>
				</div>
				<%
				}
				%>

				<div>
					<label for="username">Enter your UserName:</label> <input
						type="text" id="username" name="username" required>
				</div>
				<div>
					<label for="password">Enter your Password:</label> <input
						type="password" id="password" name="password" required>
				</div>
				<input type="submit" value="Login"> <label>Don't
					have account then <a href="signup.jsp">Register</a>
				</label>
			</div>
		</form>
	</main>

	<footer>
		<h2>Creator : Mohammed Faheem</h2>
	</footer>
</body>
</html>

<style>
/* Main Login Styles */
body {
    font-family: Arial, sans-serif; /* Font for the entire page */
    margin: 0;                      /* Remove default margin */
    padding: 0;                     /* Remove default padding */
    background: linear-gradient(135deg, #000000, #434343); /* Black gradient from black to dark gray */
    overflow: auto;                 /* Light gray background */
}

/* Main container for login page */
.login-main {
    display: flex;                  /* Enable Flexbox */
    justify-content: center;        /* Center horizontally */
    align-items: center;            /* Center vertically */
    height: 100vh;                  /* Full height of the viewport */
}

/* Login container form */
.login-container {
    background: linear-gradient(135deg, #1c1c1c, #333); /* Dark gradient for the container */
    padding: 30px;                  /* Padding inside the form */
    border-radius: 8px;             /* Rounded corners */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3); /* Stronger shadow for floating effect */
    width: 400px;                   /* Fixed width for the form */
}

/* Header inside login form */
.login-container h2 {
    margin: 0 0 20px;               /* Margin for the heading */
    text-align: center;             /* Center the heading */
    font-weight: bold;              /* Make the header bold */
    color: #fff;                    /* White color for the header */
    font-size: 24px;                /* Larger font size for visibility */
}

/* Styling for input fields */
.login-container div {
    margin-bottom: 15px;            /* Space between input fields */
}

.login-container label {
    display: block;                 /* Block display for labels */
    margin-bottom: 8px;             /* Space below labels */
    color: #ddd;                    /* Light gray color for labels */
}

.login-container input[type="text"],
.login-container input[type="password"] {
    width: 95%;                    /* Full width inputs */
    padding: 12px;                 /* Padding inside inputs */
    border: 1px solid #ccc;        /* Light gray border */
    border-radius: 5px;            /* Rounded corners */
    font-size: 16px;               /* Larger font size for better readability */
}

/* Styling for the submit button */
.login-container input[type="submit"] {
    background: linear-gradient(135deg, #4CAF50, #45a049); /* Green gradient button */
    color: white;                     /* White text */
    border: none;                     /* No border */
    padding: 12px;                    /* Padding inside the button */
    border-radius: 5px;               /* Rounded corners */
    cursor: pointer;                  /* Pointer cursor on hover */
    width: 100%;                       /* Full width button */
    margin-bottom: 15px;               /* Margin below the button */
}

/* Button hover effect */
.login-container input[type="submit"]:hover {
    background: linear-gradient(135deg, #367a36, #3e8e41); /* Darker green gradient on hover */
}

/* Styling for the links */
.login-container a {
    color: #FF6347;                    /* Tomato red link color */
    text-decoration: none;             /* Remove underline */
}

.login-container a:hover {
    text-decoration: underline;        /* Underline on hover */
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
.nav-main {
    background: linear-gradient(135deg, #000000, #434343); /* Black gradient background */
    color: white; /* White text */
    padding: 25px; /* Padding around the text */
    text-align: center; /* Center the text */
    position: fixed; /* Keep it fixed at the top */
    width: 100%; /* Full width */
    top: 0; /* Fix to the top of the page */
    z-index: 1000; /* Ensure it stays above other content */
}

.nav-main h1 {
    margin: 0; /* Remove default margin */
    padding-left: 0; /* Remove left padding */
    font-size: 24px; /* Font size for the title */
    font-weight: bold; /* Make the header bold */
    text-transform: uppercase; /* Uppercase text for a bold effect */
}
</style>

