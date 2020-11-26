<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <h1>Reset Password</h1>
        <p>Please enter your email address to reset your password.</p>
        <form name="reset" method="post">
            Email Address: <input type="text" name="email" value=""><br>
            <input type="submit" value="Submit">
        </form>
        <c:choose>
            <c:when test="${message == 0}">
                <p>Your email address is wrong.</p>
            </c:when>
            <c:when test="${message == 1}">
                <p>Email for resetting your password is sent.</p>
                <a href="login">Log In</a>
            </c:when>
            <c:otherwise>
                
            </c:otherwise>
        </c:choose>

    </body>
</html>
