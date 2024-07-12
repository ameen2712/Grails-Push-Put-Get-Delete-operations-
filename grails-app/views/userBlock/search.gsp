<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Search Results</title>
</head>
<body>
<h1>Search Results</h1>

<h2>Search Query: ${searchParam}</h2>

<table class="table">
    <thead>
    <tr>
        <th>Email</th>
        <th>Phone</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${userBlocks}" var="userBlock">
        <tr>
            <td>${userBlock.email}</td>
            <td>${userBlock.phone}</td>
            <td>
                <g:link action="show" id="${userBlock.id}">Show</g:link>
                |
                <g:link action="edit" id="${userBlock.id}">Edit</g:link>
                |
                <g:form action="delete" method="POST">
                    <g:hiddenField name="id" value="${userBlock.id}" />
                    <button type="submit" class="btn btn-link">Delete</button>
                </g:form>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<g:link action="index" class="btn btn-primary">Back to user Data</g:link>
</body>
</html>
