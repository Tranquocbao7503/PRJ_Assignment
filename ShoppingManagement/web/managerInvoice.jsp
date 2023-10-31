

<%@page import="sample.shopping.OrderDisplayDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Invoices</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 
    <head>
    <body>
        <nav class="navbar navbar-expand-md bg-dark navbar-light">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="btn btn-dark" href="manager.jsp">Home</a>
                    </li>
                </ul>
            </div>
        </nav>
        <%
            // xac thuc phan quyen : chi user login voi role 'QL' moi vao duoc trang nay
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("QL")) {
                response.sendRedirect("login.html");
            }

            String searchPattern = request.getParameter("searchPattern");
            if (searchPattern == null) {
                searchPattern = "";
            }

        %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="mt-5">Order View</h1>

                    <%            List<OrderDisplayDTO> orderList = (List<OrderDisplayDTO>) request.getAttribute("LIST_INVOICE");
                        if (orderList != null) {
                            if (orderList.size() > 0) {
                    %>

                    <table class="table table-bordered mt-3">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Order ID</th>
                                <th scope="col">Customer ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  int count = 1;
                                for (OrderDisplayDTO orderDetail : orderList) {

                            %>
                        <form action="MainController" method="POST">   <%-- editting directly from the form --%>
                            <tr>
                                <td>
                                    <%= count++%>
                                </td>
                                <td>
                                    <%= orderDetail.getOrderID()%>
                                </td>
                                <td>
                                    <%= orderDetail.getUserID()%>
                                </td>
                                <td>
                                    <%= orderDetail.getName()%>
                                </td>
                                <td>
                                    <%= orderDetail.getDateOrder()%>
                                </td>

                            </tr>
                        </form> 
                        <%                }

                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </tbody>
</table>
</body>
</html>
