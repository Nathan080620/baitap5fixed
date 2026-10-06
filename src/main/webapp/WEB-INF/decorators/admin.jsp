<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> - Quản Trị Hệ Thống</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            min-height: 100vh;
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: calc(100vh - 56px);
            background-color: #212529;
        }
        .sidebar .nav-link {
            color: #adb5bd;
            padding: 12px 20px;
            font-size: 0.95rem;
            margin: 4px 8px;
            border-radius: 6px;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            color: #ffffff;
            background-color: #0d6efd;
        }
    </style>
    <sitemesh:write property='head'/>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm px-3">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin/categories">
            <i class="fa-solid fa-gauge me-2 text-primary"></i>ADMIN PORTAL
        </a>
        <div class="ms-auto d-flex align-items-center">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-light btn-sm me-2" target="_blank">
                <i class="fa-solid fa-globe me-1"></i>Trang Người Dùng
            </a>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-3 col-lg-2 d-md-block sidebar px-0">
                <div class="pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/categories">
                                <i class="fa-solid fa-layer-group me-2"></i>Quản lý Danh mục
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/users">
                                <i class="fa-solid fa-users me-2"></i>Quản lý Người dùng
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
                <sitemesh:write property='body'/>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>