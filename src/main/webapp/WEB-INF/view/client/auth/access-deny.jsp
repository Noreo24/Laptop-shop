<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>403 - Truy cập bị từ chối</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="d-flex justify-content-center align-items-center vh-100 bg-warning-subtle">
                <div class="text-center bg-white p-4 rounded border border-warning shadow">
                    <h1 class="text-warning">403</h1>
                    <h2>Truy cập bị từ chối</h2>
                    <p>Bạn không có quyền truy cập vào trang này. Vui lòng liên hệ quản trị viên nếu cần trợ giúp.</p>
                    <a href="/" class="btn btn-warning">Quay lại trang chủ</a>
                </div>
            </body>

            </html>