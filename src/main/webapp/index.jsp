<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management</title>
    <link rel="stylesheet" type="text/css" href="global.css">
</head>
<body>
<h1>Product Management</h1>

<div class="operation-links">
    <s:a href="addProduct.jsp">Add Product</s:a>
    <s:a href="displayProducts.jsp">Display Products</s:a>
    <s:a href="updateProduct.jsp">Update Product</s:a>
    <s:a href="deleteProduct.jsp">Delete Product</s:a>
</div>
</body>
</html>