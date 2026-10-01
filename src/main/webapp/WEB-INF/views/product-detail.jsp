<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<html>
    <head>
        <title>
            Chi tiết sản phẩm
        </title>
    </head>
    <body>
        <c:set var="ctx" value="${pageContext.request.contextPath}"/>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="${ctx}/home">
                        Trang chủ
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="${ctx}/products">
                        Sản phẩm
                    </a>
                </li>
                <li class="breadcrumb-item active">
                    <c:out value="${product.productName}"/>
                </li>
            </ol>
        </nav>
        <div class="detail-card">
            <div class="row g-4">
                <div class="col-md-5">
                    <img src="${product.images}" alt="${product.productName}" class="detail-img">
                </div>
                <div class="col-md-7">
                    <h3 class="mb-1">
                        <c:out value="${product.productName}"/>
                    </h3>
                    <div class="detail-price mb-3">
                        <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>
                        VNĐ
                    </div>
                    <div class="info-row">
                        <span class="k">
                            Tên sản phẩm
                        </span>
                        <span>
                            <c:out value="${product.productName}"/>
                        </span>
                    </div>
                    <div class="info-row">
                        <span class="k">
                            Mã sản phẩm
                        </span>
                        <span>
                            ${product.productCode}
                        </span>
                    </div>
                    <div class="info-row">
                        <span class="k">
                            Danh mục
                        </span>
                        <span class="badge badge-cat">
                            <c:out value="${product.categoryName}"/>
                        </span>
                    </div>
                    <div class="info-row">
                        <span class="k">
                            Giá
                        </span>
                        <span>
                            <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>
                            VNĐ
                        </span>
                    </div>
                    <div class="info-row">
                        <span class="k">
                            Amount
                        </span>
                        <span>
                            ${product.amount}
                        </span>
                    </div>
                    <div class="desc-box">
                        <div class="label mb-1">
                            Description
                        </div>
                        <c:out value="${product.description}"/>
                    </div>
                    <div class="mt-4">
                        <p class="text-muted">
                            Còn lại: ${product.stock} sản phẩm
                        </p>
                        <c:choose>
                            <c:when test="${product.status != 1 || product.stock == null || product.stock <= 0}">
                                <button class="btn btn-secondary" disabled>
                                    Tạm hết hàng
                                </button>
                            </c:when>
                            <c:when test="${sessionScope.account == null}">
                                <a class="btn btn-primary" href="${ctx}/login">
                                    Đăng nhập để mua hàng
                                </a>
                            </c:when>
                            <c:otherwise>
                                <form action="${ctx}/cart" method="post" class="d-flex flex-wrap align-items-center gap-2">
                                    <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="productId" value="${product.productId}">
                                    <label for="buyQuantity">
                                        Số lượng
                                    </label>
                                    <input class="form-control commerce-quantity" type="number" id="buyQuantity" name="quantity" min="1" max="${product.stock < 1000 ? product.stock : 1000}" value="1" required>
                                    <button class="btn btn-primary" type="submit">
                                        <i class="bi bi-cart-plus">
                                        </i>
                                        Thêm vào giỏ hàng
                                    </button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <a href="${ctx}/products" class="btn btn-secondary mt-4">
            <i class="bi bi-arrow-left">
            </i>
            Quay lại danh sách
        </a>
    </body>
</html>
