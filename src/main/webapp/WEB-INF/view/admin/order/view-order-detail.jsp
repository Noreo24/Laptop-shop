<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- format tiền -->
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Đơn hàng ${currentOrder.getId()}</title>
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
                                    <h1 class="mt-4">Quản lý đơn hàng</h1>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <hr>
                                                <table class="table table-hover table-bordered ">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">Ảnh</th>
                                                            <th scope="col">Tên sản phẩm</th>
                                                            <th scope="col">Giá</th>
                                                            <th scope="col">Số lượng</th>
                                                            <th scope="col">Thành tiền</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="currentOrderDetail"
                                                            items="${currentOrderDetails}">
                                                            <tr>
                                                                <th>${currentOrderDetail.getId()}</th>
                                                                <td>
                                                                    <div
                                                                        class="d-flex align-items-center justify-content-center">
                                                                        <img class="img-fluid me-5"
                                                                            src="/images/product/${currentOrderDetail.getProduct().getImage()}"
                                                                            style="width: 80px; height: 80px;"
                                                                            alt="Card image cap">
                                                                    </div>
                                                                </td>
                                                                <td>${currentOrderDetail.getProduct().getName()}</td>
                                                                <td>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${currentOrderDetail.getPrice()}" />
                                                                    đ
                                                                </td>
                                                                <td>${currentOrderDetail.getQuantity()}</td>
                                                                <td>
                                                                    <fmt:formatNumber type="number" value="${currentOrderDetail.getQuantity() *
                                                                            currentOrderDetail.getPrice()}" />
                                                                    đ
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <a href="/admin/order" class="btn btn-success mt-3">Quay lại</a>
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