<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String errorMessage = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <script>
        function validatePassword() {
            var password = document.getElementById("password").value;
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText == "invalid") {
                        document.getElementById("passwordError").innerText =
                            "Invalid password! Must be at least 8 characters, have 1 uppercase letter, 1 digit, and exactly 1 special character.";
                    } else {
                        document.getElementById("passwordError").innerText = "";
                    }
                }
            };
            xhr.open("GET", "PasswordValidationServlet?password=" + encodeURIComponent(password), true);
            xhr.send();
        }
    </script>
</head>
<body>
    <h2>Login</h2>

    <% if (errorMessage != null) { %>
        <p style="color:red;"><%= errorMessage %></p>
    <% } %>

    <form action="LoginServlet" method="post">
        <label>Username:</label>
        <input type="text" name="username" required>
        <br>

        <label>Password:</label>
        <input type="password" name="password" id="password" required onkeyup="validatePassword()">
        <span id="passwordError" style="color:red;"></span>
        <br>

        <input type="submit" value="Login">
    </form>
</body>
</html>
