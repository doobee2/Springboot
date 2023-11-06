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
                    <h1>공지사항 글쓰기</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->

<div class="container-fluid mb-5">
    <div class="content" id="contents">
        <section class="page-title bg-02">
            <div class="container">
                <div class="columns">
                    <div class="column is-12">
                        <div class="block has-text-centered">
                            <h1 class="is-capitalize text-lg font-happy">공지사항 작성</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section blog-wrap container">
            <table class="table">
                <form action="${path }/notice/add" method="post">
                    <table id="table1" class="table">
                        <tbody>
                        <tr>
                            <th class="has-text-white has-text-centered">글 제목</th>
                            <td>
                                <input class="input" type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" required>
                            </td>
                        </tr>
                        <tr>
                            <th class="has-text-white has-text-centered">글 내용</th>
                            <td>
                                <textarea class="textarea" name="content" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="buttons is-centered">
                        <input type="submit" class=" btn btn-primary" value="글 등록" >
                        <a class="btn btn-warning" href="${path }/notice/list">글 목록</a>
                    </div>
                </form>
            </table>
        </section>
    </div>
</div>

<jsp:include page="../../layout/footer.jsp" />
</body>
</html>
