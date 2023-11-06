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
    <title>게시판 상세보기</title>

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
                    <h1>자유게시판 상세보기</h1>
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
        <section class="page-title bg-02">
            <div class="container">
                <div class="columns">
                    <div class="column is-12">
                        <div class="block has-text-centered">
                            <h1 class="is-capitalize text-lg font-happy">자유게시판 수정</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="section blog-wrap container">
            <form action="${path }/free/update.do" method="post">
                <table id="table1" class="table">
                    <tbody>
                    <tr>
                        <th class="has-text-white has-text-centered">글 제목</th>
                        <td>
                            <input type="hidden" name="fno" id="fno" value="${free.fno }" >
                            <input type="text" name="title" id="title" class="input" placeholder="제목 입력" value="${free.title }" maxlength="98" required>
                        </td>
                    </tr>
                    <tr>
                        <th class="has-text-white has-text-centered">글 내용</th>
                        <td>
							<textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>
                                ${free.content }
                            </textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="buttons is-centered">
                    <a class="btn btn-warning" href="${path }/free/list">글 목록</a>
                    <input type="submit" class="btn btn-primary" value="수정 완료" >
                </div>
            </form>
        </section>
    </div>
</div>
<jsp:include page="../../layout/footer.jsp" />
</body>
</html>
