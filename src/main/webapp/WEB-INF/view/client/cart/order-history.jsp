<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- format tiền -->
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Lịch sử mua hàng</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                    <style>
                        .page-link.disabled {
                            color: var(--bs-pagination-disabled-color);
                            pointer-events: none;
                            background-color: var(--bs-pagination-disabled-bg);
                        }
                    </style>
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->


                    <jsp:include page="../layout/header.jsp" />


                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">

                            <div>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb mt-3">
                                        <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                            <!--  -->
                            <c:if test="${empty(orders)}">
                                <div class="row">
                                    <div class="col-12 mt-5">
                                        <div class="alert alert-warning" role="alert">
                                            <h4 class="alert-heading">Bạn chưa từng mua sản phẩm!</h4>
                                            <p>Hãy thêm mua hàng để tiếp tục.</p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${!empty(orders)}">
                                <!-- List product in cart -->
                                <div class="table-responsive">
                                    <table class="table">

                                        <thead>
                                            <tr>
                                                <th scope="col">Ảnh sản phẩm</th>
                                                <th scope="col">Tên sản phẩm</th>
                                                <th scope="col">Giá</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Thành tiền</th>
                                                <th scope="col">Trạng thái</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="order" items="${orders}" varStatus="status">

                                                <tr class="table-active">
                                                    <th>
                                                        Order ID = ${order.getId()}
                                                    </th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th>
                                                        <fmt:formatNumber type="number"
                                                            value="${order.getTotalPrice()}" /> đ
                                                    </th>
                                                    <th>${order.getStatus()}</th>
                                                </tr>

                                                <c:forEach var="orderDetail" items="${order.getOrderDetails()}">
                                                    <tr>
                                                        <td>
                                                            <div
                                                                class="d-flex align-items-center justify-content-center">
                                                                <img class="img-fluid me-5"
                                                                    src="/images/product/${orderDetail.getProduct().getImage()}"
                                                                    style="width: 80px; height: 80px;"
                                                                    alt="Card image cap">
                                                            </div>
                                                        </td>
                                                        <td>${orderDetail.getProduct().getName()}</td>
                                                        <td>
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.getPrice()}" />
                                                            đ
                                                        </td>
                                                        <td>${orderDetail.getQuantity()}</td>
                                                        <td>
                                                            <fmt:formatNumber type="number" value="${orderDetail.getQuantity() *
                                                                orderDetail.getPrice()}" />
                                                            đ
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </c:forEach>

                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>

                        </div>
                    </div>
                    <!-- Cart Page End -->

                    <jsp:include page="../layout/footer.jsp" />

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>

                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>