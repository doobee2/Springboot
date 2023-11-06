<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <jsp:include page="../layout/head.jsp" />
</head>
<body>

<jsp:include page="../layout/header.jsp" />

<!-- Start Hero Section -->
<div class="hero">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="intro-excerpt">
                    <h1>제품목록</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->

<div class="row justify-content-md-end my-5">
    <div class="col-md-4 searchArea">
        <form action="${path }/book/list" method="get" class="field has-addons has-addons-right">
            <input type="hidden" name="no" value="${book.bno }" />
            <div class="input-group">
                <div class="input-group-append">
                    <select id="inputState" name="type" class="form-control rounded-0 border-right-0">
                        <option value="lect_tit"<c:if test="${type eq 'title'}"> selected="selected"</c:if>>도서명</option>
                        <option value="teacherNm"<c:if test="${type eq 'content'}"> selected="selected"</c:if>>내용</option>
                    </select>
                </div>
                <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-primary rounded-0" type="submit">검색</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="untree_co-section product-section before-footer-section">
    <div class="container">
        <div class="row">

            <c:forEach items="${bookList }" var="book" varStatus="status">
            <!-- 상품목록(이미지) -->
            <div class="col-12 col-md-4 col-lg-3 mb-5">
                <a class="product-item" href="${path }/book/get?bno=${book.bno }">
                    <c:choose>
                        <c:when test="${!empty lecture.thumbnail}">
                            <img src="${path }/resources/upload/#{book.img}" class="img-fluid product-thumbnail">
                        </c:when>
                        <c:otherwise>
                            <img src="${path }/resources/image/dummy.png" />
                        </c:otherwise>
                    </c:choose>
                    <h3 class="product-title">${book.title}</h3>
                    <strong class="product-price"><fmt:formatNumber value="${book.cost }" pattern="#,###" />원</strong>
                    <span class="icon-cross">
                        <img src="${path }/resource/images/cross.svg" class="img-fluid">
					</span>
                </a>
            </div>
            <!-- End Column 1 -->
            </c:forEach>

        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />
</body>
</html>
    