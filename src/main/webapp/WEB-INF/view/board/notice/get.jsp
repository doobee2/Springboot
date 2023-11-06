<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<html>
<head>
    <title>Title</title>
    <link href="${path }/resource/css/boardget.css" rel="stylesheet">
    <jsp:include page="../../layout/head.jsp" />
</head>
<body>

<jsp:include page="../../layout/header.jsp" />

<!-- Start Hero Section -->
<div class="hero">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="intro-excerpt">
                    <h1>공지사항 상세보기</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->
<div class="container-fluid mb-5">
    <div class="content">
        <section class="section blog-wrap container">
            <div class="detail">
                <div class="conwrap">
                    <div class="viewbody">
                        <div class="hgroup">
                            <div class="no">NO ${notice.no }</div>
                            <div class="tit">${notice.title }</div>
                            <div class="util">
                                <div class="date">작성일${notice.regdate }</div>
                                <div class="hit">조회수 ${notice.visited }</div></div>
                        </div>
                        <div class="content">
                            ${notice.content }
                        </div>
                        <div class="buttons is-centered">
                            <a class="btn btn-warning" href="${path }/notice/list">목록</a>
                            <a class="btn btn-info" href="${path }/notice/update?no=${notice.no}">수정</a>
                            <a class="btn btn-danger" href="${path }/notice/delete?no=${notice.no}">삭제</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="../../layout/footer.jsp" />
</body>
</html>
