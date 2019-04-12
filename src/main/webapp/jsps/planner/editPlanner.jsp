<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>Edit list</title>
</head>
<body background="C:\Users\Luiza Bilteanu\IdeaProjects\finalProject\target\finalProject\planner.jpeg">

<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <h1> Edit list details:
                <h1>&nbsp;</h1>
                <form method="post" action="/home/lists">
                    <input type="hidden" name="action" value="update">
                    <div class="form-group">
                        <label for="name">List name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name"
                               value="<c:out value="${planner.id}"/>">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" class="form-control" id="description" name="description"
                               placeholder="Description" value="<c:out value="${planner.description}"/>">
                    </div>
                    <button type="submit" class="btn btn-primary" name="action" value="UPDATE"> UPDATE
                    </button>

                </form>


                <%--<form method="post" action="/home/lists">--%>
                <%--<input type="hidden" name="action" value="update">--%>
                <%--<input type="hidden" name="id" value="<c:out value="${planner.id}"/>">--%>
                <%--<input type="text" name="name" value="<c:out value="${planner.name}"/>">--%>
                <%--<input type="text" name="description" value="<c:out value="${planner.description}"/>">--%>
                <%--<input type="submit" value="UPDATE">--%>
                <%--</form>--%>

            </h1>
        </div>
    </div>
</div>
</div>
</body>


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

