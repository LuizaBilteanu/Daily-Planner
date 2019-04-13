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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/webResources/backgroundTest.css">


    <title> Daily planner </title>

</head>
<body>
<div class="background-transparency">
<div class="dropdown">
    <button class="btn btn-dark dropdown-toggle btn-lg" type="button" data-toggle="dropdown">Menu
        <span class="caret"></span></button>

    <div class="dropdown-menu">

        <%--<ul class="buttonStyle">--%>
        <div>
            <form><a href="/home/lists" class="dropdown-item" style="text-color:black">My lists</a></form>
            <form><a href="/home/tasks" class="dropdown-item" style="text-color:black">My tasks</a></form>
        </div>

        <%--<div class="btn-group">--%>
            <%--<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"--%>
                    <%--aria-expanded="false"> Add--%>
            <%--</button>--%>

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

        <%--</div>--%>
    </div>

</div>

<br><br><br><br><br><br><br>
<div class="banner">
    <div class="container">
        <div class="banner-text">
            <div class="banner-heading">
                Let me help you get organized!
            </div>
        </div>
    </div>
</div>
</div>

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
