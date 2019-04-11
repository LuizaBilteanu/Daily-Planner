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

    <title>Add task</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <h1> Add task:
                <h1>&nbsp;</h1>
                <form method="post" action="/home/tasks">
                    <input type="hidden" name="action" value="add">

                    <div class="form-group">
                        <label for="name">Task name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${requestScope.task.name}">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" class="form-control" id="description" name="description" placeholder="Description" value="${requestScope.task.description}">
                    </div>
                    <div class="form-group">
                        <label for="date">List</label>
                        <select name="list">
                            <c:forEach items="${requestScope.lists}" var="list">
                                <option value="${list.id}">${list.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="date">Date</label>
                        <input type ="date" class="form-control" id="date" name="inputDate" placeholder="Date" >
                    </div>

                    <label for="date">Status</label>
                    <select id="status" name="status">
                        <option value="Pending">Pending</option>
                        <option value="Completed">Completed</option>

                    </select>
                    <h4>&nbsp;</h4>
                    <button type="submit" class="btn btn-primary"  name="action" value="Add"> Add
                    </button>

                </form>
            </h1>
        </div>
    </div>
</div>
</div>
</body>




<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>

