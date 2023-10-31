

<%@page import="sample.shopping.OrderDisplayDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Invoices</title>
    <head>
    <body>
        <h1> Order Manager  </h1>

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


        <%            List<OrderDisplayDTO> orderList = (List<OrderDisplayDTO>) request.getAttribute("LIST_INVOICE");
            if (orderList != null) {
                if (orderList.size() > 0) {
        %>

        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Order ID</th>
                    <th>Customer ID</th>
                    <th>Name</th>                  
                    <th>Date</th>
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

            <a href="manager.jsp" > Home </a>



</body>
</html>
