<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/webResources/listPlanner.css">

    <title>My lists</title>
</head>
<body>

<div class="dropdown">
    <button class="btn btn-dark dropdown-toggle btn-lg" type="button" data-toggle="dropdown">Menu
        <span class="caret"></span></button>
    <div class="dropdown-menu">
        <div>
            <form><a href="/home" class="dropdown-item" style="text-color:black">Home</a></form>
            <form><a href="/home/tasks" class="dropdown-item" style="text-color:black">My tasks</a></form>
            <form><a href="/home/lists" class="dropdown-item" style="text-color:black">My lists</a></form>
        </div>

        <button type="button" class="btn btn-secondary btn-group">Add</button>
        <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            <span class="sr-only">Toggle Dropdown</span></button>

        <div class="dropdown-menu">
            <a href="/home/tasks?action=add" class="dropdown-item" style="text-color:black">Add new
                task</a>
            <a href="/home/lists?action=add" class="dropdown-item" style="text-color:black">Add new
                list </a>
        </div>

    </div>
</div>

<div class="container" style="content-align: center">
    <div class="row">
        <div class="col-sm-4" style="text-align: center">
            <p style="font-size: 50px;"><b>Lists</b></p>
        </div>
        <div class="col sm-8" style="text-align: center">
            <a href="?action=add">
                <button type="button" class="btn btn-secondary btn-lg">ADD</button>
            </a>

        </div>
    </div>
    <br><br>
    <div class="row">
        <div class="scrollLists">
            <table class="table table-striped table-light" style="text-color: floralwhite">
                <thead class="table-dark">
                <tr>
                    <th scope="col" style="color:white ; font-size:130%; text-align:center;">Name</th>
                    <th scope="col" style="color:white ; font-size:130%; text-align:center;">Description</th>

                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.planners}" var="planner">
                    <tr>
                        <td style="text-align: center"><b>${planner.name} </a></b></td>
                        <td style="text-align: center"><b>${planner.description}</b></td>
                        <td style="text-align: center">
                            <a href="?action=edit&id=${planner.id}">
                                <button type="button" class="btn btn-primary">Edit</button>
                            </a>

                            <button type="button" class="btn btn-danger" data-toggle="modal"
                                    data-target="#ays${planner.id}">Delete
                            </button>
                            <div class="modal fade" id="ays${planner.id}" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog " role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">
                                                Confirmation</h5>
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true" style="text-color: black">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body" style="text-color: black">
                                            Are you sure that you want to delete this list? ${planner.name}
                                            (${planner.description})
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No
                                            </button>
                                            <a href="?action=delete&id=${planner.id}">
                                                <button type="button" class="btn btn-primary"
                                                        style="text-color: black">
                                                    Yes
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="btn btn-link" href="/home/tasks?planId=${planner.id}">
                                See tasks
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
</body>
</html>
