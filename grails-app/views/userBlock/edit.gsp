<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit User Block</title>
</head>
<body>
<h1>Edit User Block</h1>

<g:form action="update" method="POST" id="${userBlock.id}">
    <g:hiddenField name="id" value="${userBlock.id}"/>

    <div class="form-group">
        <label for="email">Email Address:</label>
        <g:field name="email" type="email" value="${userBlock.email}" required=""/>
    </div>

    <div class="form-group">
        <label for="phone">Phone Number:</label>
        <g:field name="phone" type="text" value="${userBlock.phone}" required=""/>
    </div>

    <div class="form-check">
        <input type="hidden" name="isBlock" value="false"/>
        <label class="form-check-label">
            <g:checkBox name="isBlock" value="true" checked="${userBlock.isBlock}"/> Block
        </label>
    </div>

    <g:actionSubmit class="btn btn-primary" value="Update"/>
</g:form>

<g:link action="index" class="btn btn-secondary">Back to List</g:link>
</body>
</html>
