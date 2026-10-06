<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ</title>
</head>
<body>
    <div class="p-5 mb-4 bg-white rounded-3 shadow-sm border">
        <h1 class="display-5 fw-bold text-primary">Cổng Thông Tin Quản Trị</h1>
        <p class="fs-5 text-muted">Hệ thống phân tầng kiến trúc Spring Boot với JSP/JSTL và SiteMesh Filter.</p>
        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-primary btn-lg">
                <i class="fa-solid fa-layer-group me-1"></i> Quản lý Category
            </a>
            <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-secondary btn-lg">
                <i class="fa-solid fa-users me-1"></i> Quản lý User
            </a>
        </div>
    </div>
</body>
</html>