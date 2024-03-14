<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <link rel="stylesheet" type="text/css" href="global.css">
</head>
<body>
<h1>List of Products</h1>

<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>category</th>
    </tr>

    <%

        Session session1 = FactoryProvider.getFactory().openSession();

        try {
            session1.beginTransaction();
            List<Product> products = session1.createQuery("from Product").getResultList();

            for (Product i : products) {
    %>
    <tr>
        <td><%= i.getId() %></td>
        <td><%= i.getName() %></td>
        <td><%= i.getDescription() %></td>
        <td><%= i.getPrice() %></td>
        <td><%= i.getQuantity() %></td>
        <td><%= i.getCategory() %></td>
    </tr>
    <%
            }
            session1.getTransaction().commit();
        } finally {
            if (session1 != null && session1.isOpen()) {
                session1.close();
            }
        }
    %>
</table>

<div class="container">
    <a href="index.jsp" class="btn">Home</a>
</div>
<h1>Update Product</h1>

<form action="UpdateProductAction" method="post">
    <div class="form-group">
        <label for="id">Product ID:</label>
        <input type="text" id="id" name="id" required />
    </div>
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="product.name" required />
    </div>
    <div class="form-group">
        <label for="description">Description:</label>
        <input type="text" id="description" name="product.description" required />
    </div>
    <div class="form-group">
        <label for="price">Price:</label>
        <input type="number" id="price" name="product.price" required />
    </div>
    <div class="form-group">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="product.quantity" required />
    </div>
    <div class="form-group">
        <label for="category">Category:</label>
        <input type="text" id="category" name="product.category" required />
    </div>
    <div class="form-group">
        <input type="submit" value="Update Product" />
    </div>
</form>
</body>
</html>