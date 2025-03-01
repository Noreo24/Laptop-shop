<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Tạo mới người dùng</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <!-- Show image -->
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
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
                                <h1 class="mt-4">Quản lý người dùng</h1>
                                <!-- <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Thống kê</a></li>
                                    <li class="breadcrumb-item active">Danh sách người dùng</li>
                                </ol> -->
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Tạo mới người dùng</h3>
                                            <hr>
                                            <form:form method="post" action="/admin/user/create"
                                                modelAttribute="newUser" class="row" enctype="multipart/form-data">

                                                <!-- Email -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Email:</label>
                                                    <form:input type="email"
                                                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                        path="email" />
                                                    ${errorEmail}
                                                </div>

                                                <!-- Password -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="errorPassword">
                                                        <form:errors path="password" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Mật khẩu:</label>
                                                    <form:input type="password"
                                                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                        path="password" />
                                                    ${errorPassword}
                                                </div>

                                                <!-- Phone -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label">Số điện thoại:</label>
                                                    <form:input type="text" class="form-control" path="phone" />
                                                </div>

                                                <!-- Full name -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <c:set var="errorFullname">
                                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Họ và tên:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorFullname ? 'is-invalid' : ''}"
                                                        path="fullName" />
                                                    ${errorFullname}
                                                </div>

                                                <!-- Address -->
                                                <div class="col-12 mb-3">
                                                    <label class="form-label">Địa chỉ:</label>
                                                    <form:input type="text" class="form-control" path="address" />
                                                </div>

                                                <!-- Role -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label class="form-label">Role:</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="admin">Admin</form:option>
                                                        <form:option value="user">User</form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Avatar -->
                                                <div class="col-12 col-md-6 mb-3">
                                                    <label for="avatarFile" class="form-label">Ảnh avatar:</label>
                                                    <input type="file" class="form-control" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="avatarFile" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;" alt="Avatar preview"
                                                        id="avatarPreview">
                                                </div>

                                                <div class="col-12 mx-auto">
                                                    <a href="/admin/user" class="btn btn-success">Quay lại</a>

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