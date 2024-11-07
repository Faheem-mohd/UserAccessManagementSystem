<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration</title>

</head>
<body>
	<nav class="nav-main">
		<h1>User Access Management System</h1>
	</nav>

	<main class="register-main">
		<form action="registerServlet" method="post" class="register-form">
			<div class="register-container">
				<h2>Hello !!</h2>
				<%
				String errorMessage = request.getParameter("error");
				if (errorMessage != null) {
				%>
				<div style="color: red; text-align: center;">
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

				<input type="submit" value="Register"> <label>Already
					have account then <a href="login.jsp">Login</a>
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
@charset "UTF-8";
/* Main register Styles */
body {
    font-family: Arial, sans-serif; /* Font for the entire page */
    margin: 0;                      /* Remove default margin */
    padding: 0;                     /* Remove default padding */
    background: linear-gradient(135deg, #000000, #434343); /* Dark gradient for background */
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    overflow-y: auto;               /* Ensure the page scrolls vertically */
}

.register-main {
    display: flex;                  /* Enable Flexbox */
    justify-content: center;        /* Center horizontally */
    align-items: center;            /* Center vertically */
    height: 100vh;                  /* Full height of the viewport */
    background: linear-gradient(135deg, #1c1c1c, #333); /* Dark gradient for the register container */
}

.register-container {
    background-color: #1c1c1c;        /* Dark background for the form */
    padding: 30px;                    /* Padding inside the form */
    border-radius: 8px;               /* Rounded corners */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3); /* Strong shadow for floating effect */
    width: 400px;                     /* Fixed width for the form */
    color: white;                     /* White text for form */
}

.register-container h2 {
    margin: 0 0 20px;                 /* Margin for the heading */
    text-align: center;               /* Center the heading */
    font-size: 24px;                  /* Font size for better readability */
}

.register-container div {
    margin-bottom: 15px;              /* Space between input fields */
}

.register-container label {
    display: block;                  /* Block display for labels */
    margin-bottom: 8px;               /* Space below labels */
    color: #ddd;                      /* Light gray color for labels */
}

.register-container input[type="text"],
.register-container input[type="password"] {
    width: 95%;                       /* Full width inputs */
    padding: 10px;                    /* Padding inside inputs */
    border: 1px solid #ccc;           /* Light gray border */
    border-radius: 4px;               /* Rounded corners */
    font-size: 16px;                  /* Larger font size for readability */
}

.register-container input[type="submit"] {
    background-color: #4CAF50;        /* Green background for the submit button */
    color: white;                     /* White text */
    border: none;                     /* No border */
    padding: 10px;                    /* Padding inside the button */
    border-radius: 4px;               /* Rounded corners */
    cursor: pointer;                 /* Pointer cursor on hover */
    width: 100%;                      /* Full width for the button */
    margin-bottom: 15px;              /* Space below the button */
}

.register-container input[type="submit"]:hover {
    background-color: #45a049;        /* Darker green on hover */
}

.register-container a {
    color: #FF6347;                   /* Tomato red link color */
    text-decoration: none;            /* Remove underline */
}

.register-container a:hover {
    text-decoration: underline;       /* Underline on hover */
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
}

/* Navigation Bar Styles */
.nav-main {
    background: linear-gradient(135deg, #000000, #434343); /* Dark gradient for nav */
    color: white;                         /* White text */
    padding: 25px;                        /* Padding around the text */
    text-align: center;                   /* Center the text */
    position: fixed;                      /* Fixed at the top */
    width: 100%;                          /* Full width */
    top: 0;                               /* Fix to the top of the page */
    z-index: 1000;                        /* Ensure it stays above other content */
}

.nav-main h1 {
    margin: 0;                            /* Remove default margin */
    padding-left: 0;                      /* Remove left padding */
    font-size: 24px;                      /* Font size for the title */
    font-weight: bold;                    /* Make the header bold */
    text-transform: uppercase;            /* Uppercase text */
}
</style>
