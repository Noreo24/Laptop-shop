<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- format tiền -->
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Sản phẩm ${currentProduct.getName()}</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
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
                                                <!-- <div class="d-flex justify-content-between">
                                                    <h3>${currentProduct.getName()}</h3>
                                                </div> -->
                                                <hr>
                                                <div class="card" style="width: 60%;">
                                                    <img class="card-img-top"
                                                        src="/images/product/${currentProduct.getImage()}"
                                                        alt="Card image cap">
                                                    <div class="card-header">
                                                        Thông tin sản phẩm
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${currentProduct.getId()}</li>
                                                        <li class="list-group-item">Tên sản phẩm:
                                                            ${currentProduct.getName()}
                                                        </li>
                                                        <li class="list-group-item">Giá:
                                                            <fmt:formatNumber type="number"
                                                                value="${currentProduct.getPrice()}" />
                                                            đ
                                                        </li>
                                                        <li class="list-group-item">Mô tả chi tiết:
                                                            ${currentProduct.getDetailDesc()}
                                                        </li>
                                                        <li class="list-group-item">Mô tả ngắn gọn:
                                                            ${currentProduct.getShortDesc()}
                                                        </li>
                                                        <li class="list-group-item">Số lượng:
                                                            ${currentProduct.getQuantity()}
                                                        </li>
                                                        <li class="list-group-item">Đã bán:
                                                            ${currentProduct.getSold()}
                                                        </li>
                                                        <li class="list-group-item">Hãng sản xuất:
                                                            ${currentProduct.getFactory()}
                                                        </li>
                                                        <li class="list-group-item">Mục đích sử dụng:
                                                            ${currentProduct.getTarget()}
                                                        </li>
                                                    </ul>
                                                </div>
                                                <a href="/admin/product" class="btn btn-success mt-3">Quay lại</a>
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