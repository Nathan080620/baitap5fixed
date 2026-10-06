<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${category.id == null ? 'Thêm mới' : 'Cập nhật'} Danh mục</title>
</head>
<body>
    <div class="card shadow-sm border-0 col-md-6 mx-auto mt-3">
        <div class="card-header bg-white py-3">
            <h4 class="mb-0 text-primary fw-bold">
                <i class="fa-solid ${category.id == null ? 'fa-plus' : 'fa-pen-to-square'} me-2"></i>
                ${category.id == null ? 'Thêm mới' : 'Cập nhật'} Danh mục
            </h4>
        </div>
        <div class="card-body p-4">
            <form:form modelAttribute="category" action="${pageContext.request.contextPath}/admin/categories/save" method="post">
                <form:hidden path="id"/>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Tên danh mục <span class="text-danger">*</span></label>
                    <form:input path="name" cssClass="form-control" placeholder="Nhập tên thể loại..."/>
                    <form:errors path="name" cssClass="text-danger small"/>
                </div>

                <div class="d-flex justify-content-end gap-2 mt-4">
                    <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-secondary">
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
