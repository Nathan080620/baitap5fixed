-- Chỉ cần tạo database. Bảng được Hibernate tự tạo (ddl-auto=update) khi chạy app lần đầu,
-- dữ liệu mẫu (admin / nhattan, 4 category) được nạp tự động bởi DataInitializer.
IF DB_ID('ltweb2') IS NULL
    CREATE DATABASE ltweb2;
GO
