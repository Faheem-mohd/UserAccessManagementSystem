<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Access Management System</title>
</head>

<body>
    <div class="container">
        <header>
            <h1>Welcome to User Access Management System</h1>
            <p>Easily manage access to your software</p>
        </header>

        <div class="buttons">
            <a href="signup.jsp" class="btn">Sign Up</a>
            <a href="login.jsp" class="btn">Log In</a>
        </div>
    </div>
</body>
</html>

<style>
/* Body Styling with Black Gradient */
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #000000, #434343); /* Black gradient from black to dark gray */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center; /* Center content horizontally */
    align-items: center; /* Center content vertically */
    height: 100vh; /* Full viewport height */
}

/* Container Styling */
.container {
    max-width: 800px;
    margin: 50px 0; /* Adding margin to top and bottom */
    padding: 20px;
    background: linear-gradient(135deg, #1c1c1c, #333); /* Dark gradient background for container */
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2); /* Increased shadow for floating effect */
    text-align: center;
    border-radius: 10px; /* Rounded corners */
    transform: translateY(-20px); /* Slightly move the container upwards for more "floating" effect */
}

/* Header Styles */
header h1 {
    color: #fff; /* White color for header */
    font-weight: bold;
}

header p {
    color: #ddd; /* Light gray text for paragraphs */
    font-weight: bold;
}

/* Button Container Styles */
.buttons {
    margin-top: 20px;
}

/* Button Styling */
.btn {
    display: inline-block;
    padding: 15px 30px;
    margin: 10px;
    background: linear-gradient(135deg, #4CAF50, #45a049); /* Green gradient for buttons */
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold; /* Bold text for buttons */
    transition: background-color 0.3s, transform 0.3s;
}

.btn:hover {
    background: linear-gradient(135deg, #3e8e41, #367a36); /* Darker green gradient on hover */
    transform: scale(1.05); /* Scale the button slightly on hover */
}

</style>
