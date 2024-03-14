<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link rel="stylesheet" type="text/css" href="global.css">
</head>
<body>
<h1>Error</h1>

<div class="error-message">
    An error occurred: <s:property value="actionErrors" escape="false"/>
</div>
<div class="index-link">
    <a href="index.jsp">Home</a>
</div>
</body>
</html>
