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
                    <h1>자유게시판 상세보기</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->
<div class="l-content" style="width:1280px;margin:20px auto;">
  <h2 style="text-align: center;">게시판 상세</h2>
  <table class="table" id="freeboard">
    <tbody>
      <tr>
          <th>번호</th>
          <td> ${free.fno }</td>
      </tr>
      <tr>
          <th>작성자</th>
          <td>${free.author }</td>
      </tr>
      <tr>
          <th>제목</th>
          <td>${free.title }</td>
      </tr>
      <tr>
          <th>내용</th>
          <td>${free.content}</td>
      </tr>
      <tr>
          <th>조회수</th>
          <td>${free.visited }</td>
      </tr>
      <tr>
          <th>게시일</th>
          <td>${free.regdate}</td>
      </tr>
    </tbody>
  </table>
</div>
<jsp:include page="../../layout/footer.jsp" />
</body>
</html>
