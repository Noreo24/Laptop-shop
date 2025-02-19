<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update product</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <!-- Show image -->
                <script>
                    $(document).ready(() => {
                        const updateProductFile = $("#updateProductFile");
                        const orgImage = "${currentProduct.getImage()}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#imagePreview").attr("src", urlImage);
                            $("#imagePreview").css({ "display": "block" });
                        }

                        updateProductFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imagePreview").attr("src", imgURL);
                            $("#imagePreview").css({ "display": "block" });
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
                                <h1 class="mt-4">Manage products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Products</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update product</h3>
                                            <hr>
                                            <form:form method="post" action="/admin/product/update"
                                                modelAttribute="currentProduct" class="row"
                                                enctype="multipart/form-data">

                                                <!-- ID -->
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">ID: </label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>

                                                <!-- Name -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Name:</label>
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
                                                    <label class="form-label">Price:</label>
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
                                                    <label class="form-label">Detail description:</label>
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
                                                    <label class="form-label">Short description:</label>
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
                                                    <label class="form-label">Quantity:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                        path="quantity" />
                                                    ${errorQuantity}
                                                </div>

                                                <!-- Factory -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="mac">MAC Os</form:option>
                                                        <form:option value="dell">DELL</form:option>
                                                        <form:option value="lenovo">Lenovo</form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Target -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label">Target:</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="game">Gaming</form:option>
                                                        <form:option value="svvp">Sinh viên - văn phòng</form:option>
                                                        <form:option value="design">Thiết kế đồ hoạ</form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Image -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label for="updateProductFile" class="form-label">Image:</label>
                                                    <input type="file" class="form-control" id="updateProductFile"
                                                        accept=".png, .jpg, .jpeg" name="updateProductFile" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;"
                                                        alt="Product's image preview" id="imagePreview">
                                                </div>


                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Update</button>
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
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>