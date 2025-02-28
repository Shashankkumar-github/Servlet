<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String errorMessage = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <script>
        function validateName() {
            var username = document.getElementById("username").value;
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText == "invalid") {
                        document.getElementById("nameError").innerText =
                            "Invalid name! Must start with a capital letter and have at least 3 characters.";
                    } else {
                        document.getElementById("nameError").innerText = "";
                    }
                }
            };
            xhr.open("GET", "NameValidationServlet?username=" + encodeURIComponent(username), true);
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
        <input type="text" name="username" id="username" required onkeyup="validateName()">
        <span id="nameError" style="color:red;"></span>
        <br>

        <label>Password:</label>
        <input type="password" name="password" required>
        <br>

        <input type="submit" value="Login">
    </form>
</body>
</html>
