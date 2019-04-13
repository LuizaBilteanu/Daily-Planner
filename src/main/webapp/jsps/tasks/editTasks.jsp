<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <title>Edit task</title>
</head>
<body>

<%--<form method="post" action="/home/tasks">--%>
<%--<input type="hidden" name="id" value="<c:out value="${task.id}"/>">--%>
<%--<input type="text" name="name" value="<c:out value="${task.name}"/>">--%>
<%--<input type="text" name="description" value="<c:out value="${task.description}"/>">--%>
<%--<input type="date" name="date" value="<c:out value="${task.date}"/>">--%>
<%--<input type="text" name="status" value="<c:out value="${task.status}"/>">--%>
<%--<input type="submit" value="UPDATE">--%>
<%--</form>--%>
<br><br>
<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <h1> Edit task:
                <h1>&nbsp;</h1>
                <form method="post" action="/home/tasks">
                    <input type="hidden" name="action" value="edit">

                    <input type="hidden" name="id" value="<c:out value="${task.id}"/>">
                    <div class="form-group">
                        <label for="name">Task name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name"
                               value="<c:out value="${task.name}"/>">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" class="form-control" id="description" name="description"
                               placeholder="Description" value="<c:out value="${task.description}"/>">
                    </div>
                    <div class="form-group">
                        <label for="date">List</label>
                        <select name="planId">
                            <c:forEach items="${requestScope.lists}" var="list">
                                <option value="${list.id}" ${task.planId == list.id ? 'selected' : ''}>${list.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="date">Date</label>
                        <input type="date" class="form-control" id="date" name="inputDate" placeholder="Date"
                               value="<c:out value="${task.date}"/>">
                    </div>

                    <label for="status">Status</label>
                    <select id="status" name="status">

                        <option value="Pending" ${task.status == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Completed" ${task.status == 'Completed' ? 'selected' : ''}>Completed</option>

                    </select>

                    <br><br>
                    <button type="submit" class="btn btn-secondary btn-lg" name="action" value="Edit"> UPDATE
                    </button>

                </form>
            </h1>
        </div>
    </div>
</div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>
