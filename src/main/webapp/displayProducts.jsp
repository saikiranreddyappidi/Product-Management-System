<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Product" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Products</title>
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
</body>
</html>