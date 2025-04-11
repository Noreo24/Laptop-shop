<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Xoá đơn hàng ${id}</title>
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
                                <h1 class="mt-4">Quản lý đơn hàng</h1>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Xoá đơn hàng ${id}</h3>
                                            </div>

                                            <hr>
                                            <div class="alert alert-danger" role="alert">
                                                Bạn chắc chắn muốn xoá đơn hàng này?
                                            </div>

                                            <form:form method="post" action="/admin/order/delete"
                                                modelAttribute="currentOrder">
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">ID: </label>
                                                    <form:input type="text" class="form-control" path="id"
                                                        value="${id}" />
                                                </div>

                                                <div class="col-12 mx-auto">
                                                    <a href="/admin/order" class="btn btn-success">Quay lại</a>

                                                    <span>
                                                        <button type="submit" class="btn btn-danger">Xoá</button>
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