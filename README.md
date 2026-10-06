# Spring Boot 4 – Admin CRUD (Category, User) với JSP/JSTL

Chức năng khu vực Admin:

| URL | Chức năng |
|---|---|
| `/admin/categories` | Danh sách + tìm kiếm theo tên, thêm / sửa / xóa Category |
| `/admin/users` | Danh sách + tìm kiếm theo username/email/họ tên, thêm / sửa / xóa User |

## Công nghệ
Spring Boot 4.0.x · Spring MVC · Spring Data JPA (Hibernate) · SQL Server · JSP + JSTL · SiteMesh · Bootstrap 5 (CDN)

## Chạy dự án
1. Cài JDK 17+ và SQL Server (mặc định: `localhost\SQLEXPRESS01`, user `sa`).
2. Chạy `SQLQuery2.sql` để tạo database `ltweb2` (bảng + dữ liệu mẫu tự sinh khi chạy app).
3. Nếu cấu hình DB khác, đặt biến môi trường `DB_URL`, `DB_USERNAME`, `DB_PASSWORD` (hoặc sửa `application.properties`).
4. Chạy:
   ```bash
   ./mvnw spring-boot:run        # Windows: mvnw.cmd spring-boot:run
   ```
5. Mở http://localhost:8092/admin/categories và http://localhost:8092/admin/users

Tài khoản mẫu: `admin / 123456`, `nhattan / 123456` (mật khẩu lưu BCrypt).
