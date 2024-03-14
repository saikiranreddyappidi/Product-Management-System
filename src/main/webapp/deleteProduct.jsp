<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.example.Product"%>
<%@ page import="com.example.FactoryProvider"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
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
<h1>Delete Article</h1>

<form action="DeleteProductAction" method="post">
    <label for="id">Product ID:</label>
    <input type="text" id="id" name="id"
           placeholder="Enter Product ID to Delete" required />

    <button type="submit">Delete Product</button>
</form>
</body>
</html>