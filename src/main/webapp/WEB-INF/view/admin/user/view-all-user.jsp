<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Danh sách người dùng</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">


                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>


            <body class="sb-nav-fixed">
                <!-- Header -->
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <!-- Sidebar -->
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Quản lý người dùng</h1>
                                <!-- <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Thống kê</a></li>
                                    <li class="breadcrumb-item active">Danh sách người dùng</li>
                                </ol> -->
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <!-- <h3>Danh sách người dùng</h3> -->
                                                <a href="/admin/user/create" class="btn btn-primary">Tạo mới người
                                                    dùng</a>
                                            </div>
                                            <hr>
                                            <table class="table table-hover table-bordered ">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Họ và tên</th>
                                                        <th scope="col">Role</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="user" items="${allUsers}">
                                                        <tr>
                                                            <th>${user.getId()}</th>
                                                            <td>${user.getEmail()}</td>
                                                            <td>${user.getFullName()}</td>
                                                            <td>${user.getRole().getName()}</td>
                                                            <td>
                                                                <a href="/admin/user/${user.getId()}"
                                                                    class="btn btn-success">Chi tiết</a>
                                                                <a href="/admin/user/update/${user.getId()}"
                                                                    class="btn btn-warning mx-2">Cập nhật</a>
                                                                <a href="/admin/user/delete/${user.getId()}"
                                                                    class="btn btn-danger">Xoá</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <!-- Pagination -->
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">

                                                    <!-- Button previous -->
                                                    <li class="page-item">
                                                        <a class="page-link ${currentPage == 1 ? 'disabled' : ''}"
                                                            href="/admin/user?page=${currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>

                                                    <!-- Page -->
                                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                                        <li class="page-item">
                                                            <a class="page-link ${i eq currentPage ? 'active' : ''}"
                                                                href="/admin/user?page=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>

                                                    <!-- Button next -->
                                                    <li class="page-item">
                                                        <a class="page-link ${currentPage == totalPages ? 'disabled' : ''}"
                                                            href="/admin/user?page=${currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>

                        <!-- Footer -->
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>