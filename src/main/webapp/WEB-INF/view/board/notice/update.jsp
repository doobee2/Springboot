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
</head>
<body>

<!-- Start Hero Section -->
<div class="hero">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-5">
                <div class="intro-excerpt">
                    <h1>공지사항 수정하기</h1>
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
                            <h1 class="is-capitalize text-lg font-happy">공지사항 수정</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section blog-wrap container">
            <form action="${path}/notice/edit" method="post" >

                <table class="table" id="myTable">
                    <tbody>
                    <tr>
                        <th class="has-text-centered has-text-white">글 제목</th>
                        <td>
                            <input type="hidden" name="no" id="no" placeholder="제목 입력" maxlength="98" value="${notice.no }">
                            <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" value="${notice.title }" required>
                        </td>
                    </tr>
                    <tr>
                        <th class="has-text-centered has-text-white">글 내용</th>
                        <td>
                            <textarea name="content" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>${notice.content }</textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="buttons">

                    <input type="submit" class="btn btn-primary" value="글 등록" >
                    <a class="btn btn-warning" href="${path }/notice/list">글 목록</a>
                </div>
            </form>
        </section>
    </div>


</body>
</html>
