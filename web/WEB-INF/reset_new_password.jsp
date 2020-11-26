<%-- 
    Document   : reset_new_password
    Created on : Nov 25, 2020, 5:37:52 PM
    Author     : 807785
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <h1>Enter a new Password</h1>
        <form name="reset" method="post">
            <p><input type="text" name="newpassword" value=""></p>
            <input type="hidden" name="uuid" value="${uuid}">
            <input type="submit" value="Submit">
        </form>
        <c:choose>
            <c:when test="${message == 0}">
                <p>Something went wrong. Try again.</p>
            </c:when>
            <c:when test="${message == 1}">
                <p>Successfully updated your password!</p>
                <a href="login">Log In</a>
            </c:when>
            <c:otherwise>

            </c:otherwise>
        </c:choose>
    </body>
</html>
