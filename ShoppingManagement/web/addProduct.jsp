
<%@page import="sample.errors.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>

        <%
            ProductError errorAdd = (ProductError) request.getAttribute("ERROR_ADD");
            if (errorAdd == null) {
                errorAdd = new ProductError();
            }
        %>


        <form action="MainController" method="POST">
            <div>
                Product Name<input type="text" name ="nameProduct" /> 
            </div>

            <div>
                Price <input type="number" name ="price" >
            </div>

            <div>
                Quantity<input type="number" name="quantity"/> 
            </div>


            <input type="submit" name="action" value="AddProduct"/>
        </form>
        <%= errorAdd.getNameError()%> 
        <%= errorAdd.getPriceError()%>
        <%= errorAdd.getQuantityError()%>

    </body>
</html>
