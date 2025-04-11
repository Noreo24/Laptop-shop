<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- format tiền -->
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Cập nhật đơn hàng ${currentOrder.getId()}</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h3>Cập nhật đơn hàng</h3>
                                                <hr>

                                                <form:form method="post" action="/admin/order/update"
                                                    modelAttribute="currentOrder" class="row"
                                                    enctype="multipart/form-data">

                                                    <!-- ID -->
                                                    <!-- Lấy ID -->
                                                    <div class="mb-3" style="display: none;">
                                                        <label class="form-label">ID</label>
                                                        <form:input type="text" class="form-control" path="id" />
                                                    </div>

                                                    <!-- Hiển thị ID -->
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">ID: ${currentOrder.getId()}</label>
                                                    </div>

                                                    <!-- Price -->
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Giá:
                                                            <fmt:formatNumber type="number"
                                                                value="${currentOrder.getTotalPrice()}" />
                                                            đ
                                                        </label>
                                                    </div>

                                                    <!-- Status -->
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Trạng thái:</label>
                                                        <form:select class="form-select" path="status">
                                                            <form:option value="PENDING">PENDING</form:option>
                                                            <form:option value="SHIPPING">SHIPPING</form:option>
                                                            <form:option value="COMPLETE">COMPLETE</form:option>
                                                            <form:option value="CANCEL">CANCEL</form:option>
                                                        </form:select>
                                                    </div>

                                                    <!-- Back button -->
                                                    <div class="col-12 mx-auto">
                                                        <a href="/admin/order" class="btn btn-success">Quay lại</a>

                                                        <span>
                                                            <button type="submit" class="btn btn-warning">Cập
                                                                nhật</button>
                                                        </span>
                                                    </div>
                                                </form:form>
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