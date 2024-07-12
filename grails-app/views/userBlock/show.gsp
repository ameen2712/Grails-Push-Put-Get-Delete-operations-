<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Show User Block</title>
</head>
<body>
<h1>Show User Block</h1>

<p>Email: ${userBlock.email}</p>
<p>Phone: ${userBlock.phone}</p>
<p>Created On: ${userBlock.createdOn}</p>
<p>Updated On: ${userBlock.updatedOn}</p>
<p>Blocked: ${userBlock.isBlock ? 'Yes' : 'No'}</p>

<button><g:link action="edit" id="${userBlock.id}">Edit</g:link></button>
<button><g:link action="delete" id="${userBlock.id}" method="DELETE">Delete</g:link></button>
<button><g:link action="index">Back to List</g:link></button>
</body>
</html>
