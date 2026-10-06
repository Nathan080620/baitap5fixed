<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${user.id == null ? 'Thêm mới' : 'Cập nhật'} Người dùng</title>
</head>
<body>
    <div class="card shadow-sm border-0 col-md-6 mx-auto mt-3">
        <div class="card-header bg-white py-3">
            <h4 class="mb-0 text-primary fw-bold">
                <i class="fa-solid ${user.id == null ? 'fa-plus' : 'fa-pen-to-square'} me-2"></i>
                ${user.id == null ? 'Thêm mới' : 'Cập nhật'} Người dùng
            </h4>
        </div>
        <div class="card-body p-4">
            <form:form modelAttribute="user" action="${pageContext.request.contextPath}/admin/users/save" method="post">
                <form:hidden path="id"/>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Username <span class="text-danger">*</span></label>
                    <form:input path="username" cssClass="form-control"/>
                    <form:errors path="username" cssClass="text-danger small"/>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Email <span class="text-danger">*</span></label>
                    <form:input path="email" cssClass="form-control"/>
                    <form:errors path="email" cssClass="text-danger small"/>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">
                        Mật khẩu
                        <c:if test="${user.id == null}"><span class="text-danger">*</span></c:if>
                    </label>
                    <form:password path="password" cssClass="form-control"/>
                    <c:if test="${user.id != null}">
                        <div class="form-text">Để trống nếu không muốn đổi mật khẩu.</div>
                    </c:if>
                    <form:errors path="password" cssClass="text-danger small"/>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Họ và tên</label>
                    <form:input path="fullname" cssClass="form-control"/>
                    <form:errors path="fullname" cssClass="text-danger small"/>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Vai trò (Role)</label>
                    <form:select path="role" cssClass="form-select">
                        <form:option value="USER" label="USER"/>
                        <form:option value="ADMIN" label="ADMIN"/>
                    </form:select>
                    <form:errors path="role" cssClass="text-danger small"/>
                </div>

                <div class="d-flex justify-content-end gap-2 mt-4">
                    <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-secondary">
                        <i class="fa-solid fa-arrow-left me-1"></i> Quay lại
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa-solid fa-floppy-disk me-1"></i> Lưu thông tin
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>
