<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- format tiền -->

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Danh sách sản phẩm</title>
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
                                <h1 class="mt-4">Quản lý sản phẩm</h1>
                                <!-- <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Thống kê</a></li>
                                    <li class="breadcrumb-item active">Danh sách sản phẩm</li>
                                </ol> -->
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <!-- <h3>Danh sách sản phẩm</h3> -->
                                                <a href="/admin/product/create" class="btn btn-primary">Tạo mới sản
                                                    phẩm</a>
                                            </div>
                                            <hr>
                                            <table class="table table-hover table-bordered ">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Tên sản phẩm</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Hãng sản xuất</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="product" items="${allProducts}">
                                                        <tr>
                                                            <th>${product.getId()}</th>
                                                            <td>${product.getName()}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.getPrice()}" />
                                                                đ
                                                            </td>
                                                            <td>${product.getFactory()}</td>
                                                            <td>
                                                                <a href="/admin/product/${product.getId()}"
                                                                    class="btn btn-success">Chi tiết</a>
                                                                <a href="/admin/product/update/${product.getId()}"
                                                                    class="btn btn-warning mx-2">Cập nhật</a>
                                                                <a href="/admin/product/delete/${product.getId()}"
                                                                    class="btn btn-danger">Xoá</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
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