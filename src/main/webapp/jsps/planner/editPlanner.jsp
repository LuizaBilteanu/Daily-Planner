<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Edit list details</title>
</head>
<body background="C:\Users\Luiza Bilteanu\IdeaProjects\finalProject\target\finalProject\planner.jpeg">

<form method="post" action="/home/lists">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<c:out value="${planner.id}"/>">
    <input type="text" name="name" value="<c:out value="${planner.name}"/>">
    <input type="text" name="description" value="<c:out value="${planner.description}"/>">
    <input type="submit" value="UPDATE">
</form>

</body>
</html>
