<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Đăng nhập</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Đăng nhập</h3>
                                            </div>
                                            <div class="card-body">
                                                <form method="post" action="/login">

                                                    <!-- Hiển thị thông báo lỗi nếu đăng nhập sai -->
                                                    <c:if test="${param.error != null}">
                                                        <div class="my-2" style="color: red;">Sai email hoặc mật khẩu.
                                                        </div>
                                                    </c:if>

                                                    <!-- Hiển thị thông báo đã đăng xuất-->
                                                    <c:if test="${param.logout != null}">
                                                        <div class="my-2" style="color: green;">Bạn đã đăng xuất thành
                                                            công.
                                                        </div>
                                                    </c:if>

                                                    <!-- Email -->
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="email"
                                                            placeholder="name@example.com" name="username" />
                                                        <label for="inputEmail">Email</label>
                                                    </div>

                                                    <!-- Password -->
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="password"
                                                            placeholder="Password" name="password" />
                                                        <label for="inputPassword">Mật khẩu</label>
                                                    </div>

                                                    <div>
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                    </div>

                                                    <!-- <div class="form-check mb-3">
                                            <input class="form-check-input" id="inputRememberPassword" type="checkbox"
                                                value="" />
                                            <label class="form-check-label" for="inputRememberPassword">Remember
                                                Password</label>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <a class="small" href="password.html">Forgot Password?</a>
                                            <a class="btn btn-primary" href="index.html">Login</a>
                                        </div> -->

                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block">
                                                                Đăng nhập
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>

                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/register">Đăng ký</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>