<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Danh mục</title>
</head>
<body>
    <div class="card shadow-sm border-0">
        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
            <h4 class="mb-0 text-primary fw-bold">
                <i class="fa-solid fa-layer-group me-2"></i>Danh sách Danh mục
            </h4>
            <a href="${pageContext.request.contextPath}/admin/categories/add" class="btn btn-success">
                <i class="fa-solid fa-plus me-1"></i> Thêm mới
            </a>
        </div>
        <div class="card-body">
            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fa-solid fa-circle-check me-2"></i><c:out value="${message}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fa-solid fa-triangle-exclamation me-2"></i><c:out value="${error}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/categories" method="get" class="row g-2 mb-4">
                <div class="col-md-5">
                    <div class="input-group">
                        <input type="text" name="keyword" value="<c:out value='${keyword}'/>" class="form-control" placeholder="Tìm theo tên danh mục...">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa-solid fa-magnifying-glass me-1"></i> Tìm kiếm
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-outline-secondary">Làm mới</a>
                    </div>
                </div>
            </form>

            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th style="width: 10%;">ID</th>
                        <th>Tên Danh Mục</th>
                        <th style="width: 20%;" class="text-center">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${categories}">
                        <tr>
                            <td>${item.id}</td>
                            <td class="fw-semibold"><c:out value="${item.name}"/></td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/admin/categories/edit/${item.id}" class="btn btn-sm btn-outline-warning me-1">
                                    <i class="fa-solid fa-pen-to-square"></i> Sửa
                                </a>
                                <form action="${pageContext.request.contextPath}/admin/categories/delete/${item.id}" method="post" class="d-inline"
                                      onsubmit="return confirm('Bạn có chắc muốn xóa danh mục này?');">
                                    <button type="submit" class="btn btn-sm btn-outline-danger">
                                        <i class="fa-solid fa-trash"></i> Xóa
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty categories}">
                        <tr>
                            <td colspan="3" class="text-center text-muted py-4">Không tìm thấy bản ghi nào.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
