<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- Start Header/Navigation -->
<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

    <div class="container">
        <a class="navbar-brand" href="${path }/">Tsherpa<span>.</span></a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsFurni">
            <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                <li class="nav-item active">
                    <a class="nav-link" href="${path }/">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <button class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        게시판
                    </button>
                    <ul class="dropdown-menu dropdown-menu-dark">
                        <li><a class="dropdown-item" href="${path }/notice/list">공지사항</a></li>
                        <li><a class="dropdown-item" href="${path }/free/list">자유게시판</a></li>
                    </ul>
                </li>
                <li><a class="nav-link" href="${path }/shop">상품보기</a></li>
            <c:if test="${empty principal}">
                <li><a class="nav-link" href="${path }/login">로그인</a></li>
                <li><a class="nav-link" href="${path }/join">회원가입</a></li>
            </c:if>
            <c:if test="${not empty principal}">
                <h2>${principal}</h2>
                <li>
                    <form action="/logout" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="nav-link">로그아웃</button>
                    </form>
                </li>
                <li><a href="${path }/updateForm?id=${principal}" class="nav-link">정보수정</a></li>
                <li><a href="${path }/withdraw?id=${principal}" class="nav-link">회원탈퇴</a></li>
            </c:if>
            </ul>
            <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                <li><a class="nav-link" href="#"><img src="${path }/resource/images/user.svg"></a></li>
                <li><a class="nav-link" href="cart.html"><img src="${path }/resource/images/cart.svg"></a></li>
            </ul>
        </div>
    </div>

</nav>
<!-- End Header/Navigation -->