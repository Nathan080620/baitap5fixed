<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Người dùng</title>
</head>
<body>
    <div class="card shadow-sm border-0">
        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
            <h4 class="mb-0 text-primary fw-bold">
                <i class="fa-solid fa-users me-2"></i>Danh sách Người dùng
            </h4>
            <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-success">
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

            <form action="${pageContext.request.contextPath}/admin/users" method="get" class="row g-2 mb-4">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" name="keyword" value="<c:out value='${keyword}'/>" class="form-control" placeholder="Tìm theo username, email hoặc họ tên...">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa-solid fa-magnifying-glass me-1"></i> Tìm kiếm
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-outline-secondary">Làm mới</a>
                    </div>
                </div>
            </form>

            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th style="width: 8%;">ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Họ tên</th>
                        <th style="width: 10%;">Vai trò</th>
                        <th style="width: 18%;" class="text-center">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td>${u.id}</td>
                            <td class="fw-semibold"><c:out value="${u.username}"/></td>
                            <td><c:out value="${u.email}"/></td>
                            <td><c:out value="${u.fullname}"/></td>
                            <td>
                                <span class="badge ${u.role == 'ADMIN' ? 'bg-danger' : 'bg-info'}"><c:out value="${u.role}"/></span>
                            </td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/admin/users/edit/${u.id}" class="btn btn-sm btn-outline-warning me-1">
                                    <i class="fa-solid fa-pen-to-square"></i> Sửa
                                </a>
                                <form action="${pageContext.request.contextPath}/admin/users/delete/${u.id}" method="post" class="d-inline"
                                      onsubmit="return confirm('Bạn có chắc chắn muốn xóa user này?');">
                                    <button type="submit" class="btn btn-sm btn-outline-danger">
                                        <i class="fa-solid fa-trash"></i> Xóa
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty users}">
                        <tr>
                            <td colspan="6" class="text-center text-muted py-4">Không tìm thấy bản ghi nào.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
