<%--
  Created by IntelliJ IDEA.
  User: wjdals4108@icloud.com
  Date: 2020-10-16
  Time: 오전 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Clean Blog - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../css/clean-blog.min.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<%@ include file="../main/index-nav.jsp" %>

<!-- Page Header -->
<header class="masthead" style="background-image: url('../img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="page-heading">
                    <h1>Sign In</h1>
                    <span class="subheading">Input Your ID and Password</span>
                </div> </div> </div>
    </div>
</header>
<%
    Cookie[] cookies = request.getCookies();
    String cookie_id = null;
    if(cookies != null) {
        for(Cookie tempCookie : cookies) {
            if(tempCookie.getName().equals("id")) {
                request.setAttribute("cookie_id", tempCookie.getValue());
            }
        }
    }
%>
<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <p>Want to get in touch? Fill out the form below to send me a message and I will get back to you as soon as possible!</p>
            <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
            <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
            <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
            <form action="./login.do" method="get" name="singinForm" id="singinForm" novalidate>
                <c:choose>
                    <c:when test="${cookie == null}">
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>ID</label>
                                <input type="text" class="form-control" placeholder="ID" name="id" required data-validation-requiredmessage="Please enter your id.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>ID</label>
                                <input type="text" class="form-control" placeholder="ID" name="id" value="${cookie_id}" required datavalidation-required-message="Please enter your id.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <label>PW</label>
                        <input type="password" class="form-control" placeholder="PW" name="pw" required data-validation-requiredmessage="Please enter your pw.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="control-group">
                    <div class="form-group controls">
                        <label>Remember ID</label>
                        <input type="checkbox" name="checked" value="yes">
                    </div>
                </div>
                <br>
                <div id="success"></div>
                <button type="submit" class="btn btn-primary" id="sendMessageButton">Sign In</button>
            </form>
        </div>
    </div>
</div>

<hr>

<!-- Footer -->
<%@ include file="../main/index-footer.jsp" %>
</body>

</html>

