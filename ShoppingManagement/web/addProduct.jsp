
<%@page import="sample.errors.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #2c3338;
                color: #606468;
            }

            .login {
                border: 3px solid #f1f1f1;
                width: 100%;
                max-width: 400px;
                padding: 20px;
                text-align: center;
                background-color: #363b41;
            }

            .loginForm {
                overflow: hidden;
            }

            .loginForm label {
                text-align: left;
                display: block;
                color: #eee;
                margin-top: 10px;
            }

            .loginForm input[type="text"],
            .loginForm input[type="number"] {
                width: 100%;
                padding: 16px;
                margin: 8px 0;
                display: block;
                border: none;
                border-radius: 0.25rem;
                background-color: #3b4148;
                color: #eee;
                font-size: 16px;
                line-height: 1.5;
                outline: none;
            }

            .loginForm input[type="text"]::placeholder,
            .loginForm input[type="number"]::placeholder {
                color: #ccc;
            }

            .textInput {
                text-align: left;
                margin-bottom: 10px;
                padding-left: 20px;
                padding-right: 20px;
            }

            .submit-reset {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }

            .submit-reset input[type="submit"],
            .submit-reset input[type="reset"] {
                flex: 1;
                padding: 14px 20px;
                margin: 8px 4px;
                border: none;
                border-radius: 0.25rem;
                cursor: pointer;
                text-transform: uppercase;
            }

            .submit-reset input[type="submit"] {
                background-color: #ea4c88;
                color: #eee;
                font-weight: 700;
            }

            .submit-reset input[type="reset"] {
                background-color: #d44179;
                color: #eee;
            }

            .error-message {
                color: #ff0000;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div class="login">
            <h1 >Add a New Product</h1>

            <%
                ProductError errorAdd = (ProductError) request.getAttribute("ERROR_ADD");
                if (errorAdd == null) {
                    errorAdd = new ProductError();
                }
            %>

            <form class="loginForm" action="MainController" method="POST">
                <label>Product Name</label>
                <input type="text" name="nameProduct" id="nameProduct" required="">
                <span class="text-danger"><%= errorAdd.getNameError()%></span>
                <br>
                <label>Price</label>
                <input type="number" name="price" id="price" required="">
                <span class="text-danger"><%= errorAdd.getPriceError()%></span>
                <br>
                <label>Quantity</label>
                <input type="number" name="quantity" id="quantity" required="">
                <span class="text-danger"><%= errorAdd.getQuantityError()%></span>
                <div class="submit-reset">
                    <input type="submit" class="btn btn-primary" name="action" value="AddProduct">
                </div>
            </form>
        </div>
    </body>
</html>
