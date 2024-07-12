<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>User Blocks</title>
</head>
<body>
<div class="container">
    <h1>User Blocks</h1>

    <div class="homebars">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createUserBlockModal">
        Create New User Block
    </button>
        <form action="${createLink(controller: 'userBlock', action: 'search')}" method="GET" class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search Email or Phone Number" aria-label="Search" name="q">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>
    <table class="table mt-3">
        <thead>
        <tr>
            <th>Email</th>
            <th>Phone</th>
            <th>Created On</th>
            <th>Updated On</th>
            <th>Blocked</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userBlockList}" var="userBlock">
            <tr>
                <td>${userBlock.email}</td>
                <td>${userBlock.phone}</td>
                <td>${userBlock.createdOn}</td>
                <td>${userBlock.updatedOn}</td>
                <td>${userBlock.isBlock ? 'Yes' : 'No'}</td>
                <td>
                    <button><g:link action="show" id="${userBlock.id}">Show</g:link></button>
                    <button><g:link action="edit" id="${userBlock.id}">Edit</g:link></button>
                    <button><g:link action="delete" id="${userBlock.id}" method="DELETE">Delete</g:link></button>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="modal fade" id="createUserBlockModal" tabindex="-1" role="dialog" aria-labelledby="createUserBlockModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 >Create New User Block</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form action="save" method="POST">
                    <div class="form-group">
                        <label for="email">Email Address:</label>
                        <g:field name="email" type="email" class="form-control" required=""/>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone Number:</label>
                        <g:field name="phone" type="text" class="form-control" required=""/>
                    </div>

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="isBlock" name="isBlock" value="true">
                        <label class="form-check-label" for="isBlock">Block</label>
                    </div>

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="isUnBlock" name="isUnBlock" value="false">
                        <label class="form-check-label" for="isUnBlock">Unblock</label>
                    </div>

                    <button type="submit" class="btn btn-primary mt-3">Save</button>
                </g:form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
