<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/webResources/listTasks.css">

    <title>My lists</title>
</head>
<body>

<div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Menu
        <span class="caret"></span></button>
    <ul class="dropdown-menu">
        <a href="/home" class="btn btn-link" role="button">Home</a>
        <form><a href="/home/tasks" class="btn btn-link" role="button">My tasks</a></form>
        <form><a href="/home/tasks?action=add" class="btn btn-info" role="button">Add new task</a></form>
        <a href="/home/lists?action=add" class="btn btn-info" role="button">Add new list  </a>
    </ul>
</div>
<%--<div class="dropdown">--%>
    <%--<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">My lists--%>
        <%--<span class="caret"></span></button>--%>
    <%--<ul class="dropdown-menu">--%>

        <%--<li><button type="button" class="btn btn-primary">Add new list</button></li>--%>
    <%--</ul>--%>
<%--</div>--%>
<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <h1>Lists</h1>
        </div>
        <div class="col sm-8">
            <a href="?action=add">
                <button type="button" class="btn btn-primary">Add</button>
            </a>

        </div>
    </div>
    <div class="row">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Description</th>

                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.planners}" var="planner">
                <tr>
                    <td> <a href="?action=edit&id=${planner.id}"> ${planner.name} </a></td>
                    <td>${planner.description}</td>

                    <td>
                        <a href="?action=edit&id=${planner.id}">
                            <button type="button" class="btn btn-primary">Edit</button>
                        </a>

                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#ays${planner.id}">Delete</button>
                        <div class="modal fade" id="ays${planner.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure that you want to delete this list? ${planner.name} (${planner.description})
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        <a href="?action=delete&id=${planner.id}">
                                            <button type="button" class="btn btn-primary">Yes</button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>
