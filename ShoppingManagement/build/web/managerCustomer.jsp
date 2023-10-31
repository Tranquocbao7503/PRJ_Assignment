

<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager - Customer</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-dark navbar-light">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="btn btn-dark" href="manager.jsp">Manager</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <h1 class="mt-5">Customer Management</h1>

            <%
                // Your authentication code here
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !loginUser.getRoleID().equals("QL")) {
                    response.sendRedirect("login.html");
                }

                String searchPattern = request.getParameter("searchPattern");
                if (searchPattern == null) {
                    searchPattern = "";
                }
            %>

            <form class="mt-3" action="MainController" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="searchPattern" value="<%= searchPattern%>" placeholder="Search Customer" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="submit" name="action" value="SearchCustomer">Search</button>
                    </div>
                </div>
            </form>

            <%
                String listEmpty = (String) request.getAttribute("LIST_SEARCH_EMPTY");
                if (listEmpty == null) {
                    listEmpty = "";
                }
            %>

            <p><%= listEmpty%></p>

            <%
                List<UserDTO> listCustomer = (List<UserDTO>) request.getAttribute("LIST_CUSTOMER");
                if (listCustomer != null) {
                    if (listCustomer.size() > 0) {
            %>

            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Customer ID</th>
                        <th>Username</th>
                        <th>Name</th>                  
                        <th>Update Customer</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%  int count = 1;
                        for (UserDTO customer : listCustomer) {
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= count++%></td>
                        <td><%= customer.getUserID()%></td>
                        <td><%= customer.getUserName()%></td>
                        <td>
                            <input type="text" class="form-control" name="name" value="<%= customer.getName()%>" />
                        </td>
                        <td>
                            <button type="submit" class="btn btn-primary" name="action" value="Update Customer">Update Customer</button>
                            <input type="hidden" name="customerID" value="<%= customer.getUserID()%>" />
                            <input type="hidden" name="searchPattern" value="<%= searchPattern%>" />
                            <input type="hidden" name="userName" value="<%= customer.getUserName()%>" />
                        </td>
                        <td>
                            <a class="btn btn-danger" href="MainController?action=DeleteCustomerFromManager&customerID=<%= customer.getUserID()%>&search=<%= searchPattern%>">Delete</a>
                        </td>
                    </tr>
                </form>
                <% }
                %>
                <%
                    String updateStatus = (String) session.getAttribute("UPDATE_SUCCESS");
                    if (updateStatus == null) {
                        updateStatus = "";
                    }
                %>
                <p><%= updateStatus%></p>
                </tbody>
            </table>

            <%
                    }
                }
            %>
        </div>
</html>
