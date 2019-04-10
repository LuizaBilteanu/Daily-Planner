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

    <title>Edit hobbies</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-4">
            <h1>Hobbies
                <c:choose>
                    <c:when test="${requestScope.hobby != null}">
                        EDIT
                    </c:when>
                    <c:otherwise>
                        ADD
                    </c:otherwise>
                </c:choose>
            </h1>
        </div>
    </div>

    <form method="POST">

        <div class="form-group">
            <label for="name">Hobby name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${requestScope.hobby.name}">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input type="text" class="form-control" id="description" name="description" placeholder="Description" value="${requestScope.hobby.description}">
        </div>
        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${requestScope.hobby != null}">
                    EDIT
                </c:when>
                <c:otherwise>
                    ADD
                </c:otherwise>
            </c:choose>
        </button>
    </form>
</div>




<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>

