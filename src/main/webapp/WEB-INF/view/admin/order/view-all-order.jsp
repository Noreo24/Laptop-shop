<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- format tiền -->

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Danh sách đơn hàng</title>
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
                                                <div class="d-flex justify-content-between"></div>
                                                <hr>
                                                <table class="table table-hover table-bordered ">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">Thành tiền</th>
                                                            <th scope="col">Khách hàng</th>
                                                            <th scope="col">Status</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="order" items="${allOrders}">
                                                            <tr>
                                                                <th>${order.getId()}</th>
                                                                <td>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${order.getTotalPrice()}" />
                                                                    đ
                                                                </td>
                                                                <td>${order.getReceiveName()}</td>
                                                                <td>${order.getStatus()}</td>
                                                                <td>
                                                                    <a href="/admin/order/${order.getId()}"
                                                                        class="btn btn-success">Chi tiết</a>
                                                                    <a href="/admin/order/update/${order.getId()}"
                                                                        class="btn btn-warning mx-2">Cập nhật</a>
                                                                    <a href="/admin/order/delete/${order.getId()}"
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
                                                                href="/admin/order?page=${currentPage - 1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>

                                                        <!-- Page -->
                                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                                            <li class="page-item">
                                                                <a class="page-link ${i eq currentPage ? 'active' : ''}"
                                                                    href="/admin/order?page=${i}">${i}</a>
                                                            </li>
                                                        </c:forEach>

                                                        <!-- Button next -->
                                                        <li class="page-item">
                                                            <a class="page-link ${currentPage == totalPages ? 'disabled' : ''}"
                                                                href="/admin/order?page=${currentPage + 1}"
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
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                </body>

                </html>