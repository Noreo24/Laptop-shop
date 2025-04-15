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

                    <jsp:include page="../layout/banner.jsp" />

                    <!-- Fruits Shop Start-->
                    <div class="container-fluid fruite py-5">
                        <div class="container py-5">
                            <h1 class="mb-4">Fresh fruits shop</h1>
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-xl-3">
                                            <div class="input-group w-100 mx-auto d-flex">
                                                <input type="search" class="form-control p-3" placeholder="keywords"
                                                    aria-describedby="search-icon-1">
                                                <span id="search-icon-1" class="input-group-text p-3"><i
                                                        class="fa fa-search"></i></span>
                                            </div>
                                        </div>
                                        <div class="col-6"></div>
                                        <div class="col-xl-3">
                                            <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                                <label for="fruits">Default Sorting:</label>
                                                <select id="fruits" name="fruitlist"
                                                    class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                                    <option value="volvo">Nothing</option>
                                                    <option value="saab">Popularity</option>
                                                    <option value="opel">Organic</option>
                                                    <option value="audi">Fantastic</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row g-4">
                                        <div class="col-lg-3">
                                            <div class="row g-4">
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <h4>Categories</h4>
                                                        <ul class="list-unstyled fruite-categorie">
                                                            <li>
                                                                <div class="d-flex justify-content-between fruite-name">
                                                                    <a href="#"><i
                                                                            class="fas fa-apple-alt me-2"></i>Apples</a>
                                                                    <span>(3)</span>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="d-flex justify-content-between fruite-name">
                                                                    <a href="#"><i
                                                                            class="fas fa-apple-alt me-2"></i>Oranges</a>
                                                                    <span>(5)</span>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="d-flex justify-content-between fruite-name">
                                                                    <a href="#"><i
                                                                            class="fas fa-apple-alt me-2"></i>Strawbery</a>
                                                                    <span>(2)</span>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="d-flex justify-content-between fruite-name">
                                                                    <a href="#"><i
                                                                            class="fas fa-apple-alt me-2"></i>Banana</a>
                                                                    <span>(8)</span>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="d-flex justify-content-between fruite-name">
                                                                    <a href="#"><i
                                                                            class="fas fa-apple-alt me-2"></i>Pumpkin</a>
                                                                    <span>(5)</span>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <h4 class="mb-2">Price</h4>
                                                        <input type="range" class="form-range w-100" id="rangeInput"
                                                            name="rangeInput" min="0" max="500" value="0"
                                                            oninput="amount.value=rangeInput.value">
                                                        <output id="amount" name="amount" min-velue="0" max-value="500"
                                                            for="rangeInput">0</output>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <h4>Additional</h4>
                                                        <div class="mb-2">
                                                            <input type="radio" class="me-2" id="Categories-1"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-1"> Organic</label>
                                                        </div>
                                                        <div class="mb-2">
                                                            <input type="radio" class="me-2" id="Categories-2"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-2"> Fresh</label>
                                                        </div>
                                                        <div class="mb-2">
                                                            <input type="radio" class="me-2" id="Categories-3"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-3"> Sales</label>
                                                        </div>
                                                        <div class="mb-2">
                                                            <input type="radio" class="me-2" id="Categories-4"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-4"> Discount</label>
                                                        </div>
                                                        <div class="mb-2">
                                                            <input type="radio" class="me-2" id="Categories-5"
                                                                name="Categories-1" value="Beverages">
                                                            <label for="Categories-5"> Expired</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-9">
                                            <div class="row g-4 justify-content-center">

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