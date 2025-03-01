<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Tạo mới sản phẩm</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const productFile = $("#productFile");
                        productFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#productPreview").attr("src", imgURL);
                            $("#productPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Tạo mới sản phẩm</h3>
                                            <hr>
                                            <form:form method="post" action="/admin/product/create"
                                                modelAttribute="newProduct" class="row" enctype="multipart/form-data">

                                                <!-- Name -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Tên sản phẩm:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                        path="name" />
                                                    ${errorName}
                                                </div>

                                                <!-- Price -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="errorPrice">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Giá:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                        path="price" />
                                                    ${errorPrice}
                                                </div>

                                                <!-- Detail description -->
                                                <div class="col-12 mb-3">
                                                    <c:set var="errorDetailDesc">
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Mô tả chi tiết:</label>
                                                    <form:textarea
                                                        class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                        path="detailDesc" />
                                                    ${errorDetailDesc}
                                                </div>

                                                <!-- Short description -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="errorShortDesc">
                                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Mô tả ngắn gọn:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                                        path="shortDesc" />
                                                    ${errorShortDesc}
                                                </div>

                                                <!-- Quantity -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="errorQuantity">
                                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Số lượng:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                        path="quantity" />
                                                    ${errorQuantity}
                                                </div>

                                                <!-- Factory -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label">Hãng sản xuất:</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="Dell">Dell</form:option>
                                                        <form:option value="Apple">Apple</form:option>
                                                        <form:option value="Asus">Asus</form:option>
                                                        <form:option value="HP">HP</form:option>
                                                        <form:option value="Lenovo">Lenovo</form:option>
                                                        <form:option value="MSI">MSI</form:option>
                                                        <form:option value="Razer">Razer</form:option>
                                                        <form:option value="Acer">Acer</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="Microsoft">Microsoft</form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Target -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label">Mục đích sử dụng:</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="game">Gaming</form:option>
                                                        <form:option value="svvp">Sinh viên - Văn phòng</form:option>
                                                        <form:option value="design">Thiết kế đồ họa</form:option>
                                                        <form:option value="dev">Lập trình - Phát triển phần mềm
                                                        </form:option>
                                                        <form:option value="business">Doanh nhân - Kinh doanh
                                                        </form:option>
                                                        <form:option value="content">Sáng tạo nội dung - Video, ảnh
                                                        </form:option>
                                                        <form:option value="server">Máy chủ - Hiệu năng cao
                                                        </form:option>
                                                        <form:option value="basic">Sử dụng cơ bản - Lướt web, xem phim
                                                        </form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Image -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label for="productFile" class="form-label">Ảnh:</label>
                                                    <input type="file" class="form-control" id="productFile"
                                                        accept=".png, .jpg, .jpeg" name="productFile" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;"
                                                        alt="Product's image preview" id="productPreview">
                                                </div>

                                                <div class="col-12 mx-auto">
                                                    <a href="/admin/product" class="btn btn-success">Quay lại</a>

                                                    <span>
                                                        <button type="submit" class="btn btn-primary">Tạo mới</button>
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