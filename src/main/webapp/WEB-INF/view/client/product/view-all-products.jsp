<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- format tiền -->

                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Sản phẩm</title>

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
                </head>

                <body>
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite mt-5 py-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div class="col-lg-12">
                                    <!-- <div class="row g-4">
                                        <div class="col-xl-3">
                                            <div class="input-group w-100 mx-auto d-flex">
                                                <input type="search" class="form-control p-3" placeholder="keywords"
                                                    aria-describedby="search-icon-1">
                                                <span id="search-icon-1" class="input-group-text p-3"><i
                                                        class="fa fa-search"></i></span>
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="row g-4">
                                        <div class="col-lg-3">
                                            <div class="col-12 mb-4" id="factoryFilter">
                                                <h4>Hãng sản xuất</h4>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-1"
                                                        value="ACER">
                                                    <label class="form-check-label" for="factory-1">Acer</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-2"
                                                        value="APPLE">
                                                    <label class="form-check-label" for="factory-2">Apple</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-3"
                                                        value="ASUS">
                                                    <label class="form-check-label" for="factory-3">Asus</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-4"
                                                        value="DELL">
                                                    <label class="form-check-label" for="factory-4">Dell</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-5"
                                                        value="HP">
                                                    <label class="form-check-label" for="factory-5">HP</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-6"
                                                        value="LENOVO">
                                                    <label class="form-check-label" for="factory-6">Lenovo</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-7"
                                                        value="LG">
                                                    <label class="form-check-label" for="factory-7">LG</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-8"
                                                        value="MICROSOFT">
                                                    <label class="form-check-label" for="factory-8">Microsoft</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-9"
                                                        value="MSI">
                                                    <label class="form-check-label" for="factory-9">MSI</label>
                                                </div>

                                                <div class="col-4 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="factory-10"
                                                        value="RAZER">
                                                    <label class="form-check-label" for="factory-10">Razer</label>
                                                </div>
                                            </div>

                                            <div class="col-12 mb-4" id="targetFilter">
                                                <h4>Mục đích sử dụng</h4>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="target-1"
                                                        value="GAME">
                                                    <label class="form-check-label" for="target-1">Gaming</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="target-2"
                                                        value="SVVP">
                                                    <label class="form-check-label" for="target-2">Sinh viên - văn
                                                        phòng</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="target-3"
                                                        value="DESIGN">
                                                    <label class="form-check-label" for="target-3">Thiết kế đồ
                                                        họa</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="target-4"
                                                        value="DEV">
                                                    <label class="form-check-label" for="target-4">Lập trình</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="target-5"
                                                        value="content">
                                                    <label class="form-check-label" for="target-5">Sáng tạo nội
                                                        dung</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="target-6"
                                                        value="BUSINESS">
                                                    <label class="form-check-label" for="target-5">Doanh nhân</label>
                                                </div>
                                            </div>

                                            <div class="col-12 mb-4" id="priceFilter">
                                                <h4>Mức giá</h4>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="price-2"
                                                        value="duoi-10-trieu">
                                                    <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="price-3"
                                                        value="10-15-trieu">
                                                    <label class="form-check-label" for="price-3">Từ 10 - 15
                                                        triệu</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="price-4"
                                                        value="15-20-trieu">
                                                    <label class="form-check-label" for="price-4">Từ 15 - 20
                                                        triệu</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="checkbox" id="price-5"
                                                        value="tren-20-trieu">
                                                    <label class="form-check-label" for="price-5">Trên 20 triệu</label>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <h4>Sắp xếp</h4>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="radio" id="sort-1"
                                                        value="gia-tang-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="radio" id="sort-2"
                                                        value="gia-giam-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                                </div>

                                                <div class="col-12 form-check form-check-inline mb-3">
                                                    <input class="form-check-input" type="radio" id="sort-3" checked
                                                        value="gia-nothing" name="radio-sort">
                                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-2 text-primary text-uppercase"
                                                    style="font-size: small;" id="btnFilter">
                                                    Lọc
                                                </button>
                                            </div>
                                        </div>

                                        <div class="col-lg-9">
                                            <div class="row g-4">

                                                <c:if test="${totalPages == 0}">
                                                    <div class="col-12 text-center mt-5 mb-5 justify-content-center">
                                                        <h4>Không có sản phẩm nào</h4>
                                                    </div>
                                                </c:if>

                                                <!-- All products -->
                                                <c:forEach var="product" items="${allProducts}">
                                                    <div class="col-md-6 col-lg-4 col-xl-4">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${product.getImage()}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">Laptop</div>
                                                            <div
                                                                class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                                <h4 style="font-size: 15px;">
                                                                    <a
                                                                        href="/product/${product.getId()}">${product.getName()}</a>
                                                                </h4>
                                                                <p style="font-size: 13px;">
                                                                    ${product.getShortDesc()}</p>
                                                                <div class="d-flex flex-lg-wrap justify-content-center">
                                                                    <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                        class="text-dark fw-bold mb-3">
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.getPrice()}" /> đ
                                                                    </p>
                                                                    <form
                                                                        action="/add-product-to-cart/${product.getId()}"
                                                                        method="post">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />
                                                                        <button
                                                                            class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Thêm vào giỏ hàng
                                                                        </button>
                                                                    </form>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                                <!-- Pagination -->
                                                <c:if test="${totalPages > 0}">
                                                    <div class="pagination d-flex justify-content-center mt-5">

                                                        <!-- Button previous -->
                                                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                            <a class="rounded page-link"
                                                                href="/all-products?page=${currentPage - 1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>

                                                        <!-- Page -->
                                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                                            <li class="page-item">
                                                                <a class="rounded page-link ${i eq currentPage ? 'active' : ''}"
                                                                    href="/all-products?page=${i}">${i}</a>
                                                            </li>
                                                        </c:forEach>

                                                        <!-- Button next -->
                                                        <li
                                                            class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                            <a class="rounded page-link"
                                                                href="/all-products?page=${currentPage + 1}"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </div>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fruits Shop End-->

                    <jsp:include page="../layout/feature.jsp" />

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