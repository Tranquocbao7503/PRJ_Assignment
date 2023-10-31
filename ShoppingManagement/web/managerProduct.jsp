<%-- 
    Document   : manager_product
    Created on : Oct 27, 2023, 2:57:52 PM
    Author     : PC
--%>

<%@page import="sample.errors.ProductError"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="sample.products.ProductDTO"%>
<%@page import="sample.products.ProductDTO"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Products</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-dark navbar-light">
            <div class="container-fluid">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="btn btn-dark" href="addProduct.jsp">Add more</a>
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

        %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="mt-5">Product Management</h1>

                    <%            HashMap<Integer, ProductDTO> listProduct = (HashMap<Integer, ProductDTO>) session.getAttribute("LIST_PRODUCT_FROM_MANAGER");
                        if (listProduct != null || listProduct.size() > 0) {


                    %>

                    <table class="table table-bordered mt-3">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Product ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  int count = 1;
                                for (Map.Entry<Integer, ProductDTO> productIndex : listProduct.entrySet()) {

                            %>
                        <form action="MainController" method="POST">   <%-- editting directly from the form --%>
                            <tr>
                                <td>
                                    <%= count++%>
                                </td>
                                <td>
                                    <%= productIndex.getValue().getProductID()%>
                                </td>
                                <td>
                                    <%= productIndex.getValue().getProductName()%>
                                </td>
                                <td>
                                    <input type="text" name="price" value="<%= productIndex.getValue().getPrice()%>" >
                                </td>
                                <td>
                                    <input type="text" name="quantity" value="<%= productIndex.getValue().getQuanity()%>" >
                                </td>
                                <td>
                                    <button type="submit" name="action" class="btn btn-primary" value="EditProduct">Edit Product</button>
                                    <input type="hidden" name="productID" value="<%= productIndex.getValue().getProductID()%>" />
                                    <input type="hidden" name="productName" value="<%= productIndex.getValue().getProductName()%>"  />
                                </td>
                            </tr>
                        </form> 



                        <%                }
                            }

                        %>

                        <%                String updateStatus = (String) request.getAttribute("UPDATE_PRODUCT_SUCCESS");

                            if (updateStatus == null) {
                                updateStatus = "";
                            }
                        %>

                        <%
                            ProductError errorUpdate = (ProductError) request.getAttribute("ERROR_UPDATE");
                            if (errorUpdate == null) {
                                errorUpdate = new ProductError();
                            }

                        %>


                        <%= errorUpdate.getPriceError()%><br>
                        <%= errorUpdate.getQuantityError()%>





                        </tbody>
                    </table>
                </div>
            </div>
        </div>




    </tbody>    
</table>
<%=updateStatus%>
</body>
</html>
