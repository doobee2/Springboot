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
    <title>게시판 글작성 </title>
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
                    <h1>자유게시판 작성하기</h1>
                </div>
            </div>
            <div class="col-lg-7">

            </div>
        </div>
    </div>
</div>
<!-- End Hero Section -->

<section class="section blog-wrap container">
    <form action="${path }/free/add" method="post">
        <table id="table1" class="table">
            <tbody>
            <tr>
                <th class="has-text-white has-text-centered">글 제목</th>
                <td>
                    <input type="text" name="title" id="title" class="input" placeholder="제목 입력" maxlength="98" required>
                </td>
            </tr>
            <tr>
                <th class="has-text-white has-text-centered">글 내용</th>
                <td>
                    <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required></textarea>
<%--                    <script>--%>
<%--                        CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/util/imageUpload'});--%>
<%--                    </script>--%>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="buttons is-centered">
            <input type="submit" class="btn btn-primary" value="글 등록" >
            <a class="btn btn-warning" href="${path }/free/list">글 목록</a>
        </div>
    </form>
</section>

<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $("#contBtn").click(function () {--%>
<%--            const textarea = $("#content");--%>
<%--            const errorMessage = $("#error-message");--%>
<%--            const ck_content = $("#ck");--%>

<%--            const inputText = textarea.val();--%>
<%--            const pattern = /^[a-zA-Z0-9_\s가-힣]*$/;--%>

<%--            if (pattern.test(inputText)) {--%>
<%--                errorMessage.text("내용이 제대로 작성되었습니다.");--%>
<%--                ck_content.val("yes");--%>
<%--                // 여기에서 다른 작업 수행--%>
<%--            } else {--%>
<%--                errorMessage.text("영문, 숫자, 밑줄, 공백, 한글만 입력할 수 있습니다.");--%>
<%--                ck_content.val("no");--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>

<%--    function textCheck(f) {--%>
<%--        if(f.ck.value == "no"){--%>
<%--            alert("게시글 내용을 검사해주세요");--%>
<%--            f.content.focus();--%>
<%--            return false;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>


<jsp:include page="../../layout/footer.jsp" />
</body>
</html>
