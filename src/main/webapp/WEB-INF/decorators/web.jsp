<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> - Trang Khách Hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body { min-height: 100vh; display: flex; flex-direction: column; background-color: #fafbfc; }
        footer { margin-top: auto; }
    </style>
    <sitemesh:write property='head'/>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm mb-4">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">
                <i class="fa-solid fa-shop me-2"></i>MY APPLICATION
            </a>
            <div class="ms-auto d-flex gap-2">
                <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-dark btn-sm">
                    <i class="fa-solid fa-shield-halved me-1"></i>Khu vực Quản Trị
                </a>
            </div>
        </div>
    </nav>

    <div class="container my-3 flex-grow-1">
        <sitemesh:write property='body'/>
    </div>

    <footer class="bg-dark text-white text-center py-3">
        <div class="container">
            <small>&copy; Spring Boot JSP Application. All Rights Reserved.</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>