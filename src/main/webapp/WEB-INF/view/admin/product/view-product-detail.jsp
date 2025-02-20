<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- format tiền -->
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Product detail ${currentProduct.getId()}</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <!-- Latest compiled JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
                                    <h1 class="mt-4">Manage products</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Products</li>
                                    </ol>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Product detail with id = ${id}</h3>
                                                </div>
                                                <hr>
                                                <div class="card" style="width: 60%;">
                                                    <img class="card-img-top"
                                                        src="/images/product/${currentProduct.getImage()}"
                                                        alt="Card image cap">
                                                    <div class="card-header">
                                                        Product information
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${currentProduct.getId()}</li>
                                                        <li class="list-group-item">Name: ${currentProduct.getName()}
                                                        </li>
                                                        <li class="list-group-item">Price:
                                                            <fmt:formatNumber type="number"
                                                                value="${currentProduct.getPrice()}" />
                                                            đ
                                                        </li>
                                                        <li class="list-group-item">Detail description:
                                                            ${currentProduct.getDetailDesc()}
                                                        </li>
                                                        <li class="list-group-item">Short description:
                                                            ${currentProduct.getShortDesc()}
                                                        </li>
                                                        <li class="list-group-item">Quantity:
                                                            ${currentProduct.getQuantity()}
                                                        </li>
                                                        <li class="list-group-item">Sold:
                                                            ${currentProduct.getSold()}
                                                        </li>
                                                        <li class="list-group-item">Factory:
                                                            ${currentProduct.getFactory()}
                                                        </li>
                                                        <li class="list-group-item">Target:
                                                            ${currentProduct.getTarget()}
                                                        </li>
                                                    </ul>
                                                </div>
                                                <a href="/admin/product" class="btn btn-success mt-3">Back</a>
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