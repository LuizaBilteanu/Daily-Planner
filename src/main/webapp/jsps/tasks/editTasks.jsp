<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Edit task</title>
</head>
<body background="C:\Users\Luiza Bilteanu\IdeaProjects\finalProject\target\finalProject\planner.jpeg">

<form method="post" action="/tasks">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<c:out value="${task.id}"/>">
    <input type="text" name="name" value="<c:out value="${task.name}"/>">
    <input type="text" name="description" value="<c:out value="${task.description}"/>">
    <input type="date" name="date" value="<c:out value="${task.date}"/>">
    <input type="text" name="status" value="<c:out value="${task.status}"/>">
    <input type="submit" value="UPDATE">
</form>

</body>
</html>
