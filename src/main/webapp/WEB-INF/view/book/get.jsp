<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path }/resource/css/book.css">
    <title>Title</title>
</head>
<body>


<!-- 상단 강의 소개-->
<div class="bg-dark py-5">
    <div class="container px-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-6">
                <c:choose>
                    <c:when test="${!empty book.img}">
                        <img src="${path }/resources/upload/book/${book.img }" />
                    </c:when>
                    <c:otherwise>
                        <img src="${path }/resources/images/dummy.png" />
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-lg-6">
                <h1 class="display-5 fw-bolder text-white mb-2">${book.title }</h1>
                <h3 class="lead text-white-50 mb-4">${book.author }</h3>
                <h3 class="lead text-white-50 mb-4">${book.publish }</h3>
                <h3 class="lead text-white-50 mb-4">${book.quality }</h3>
            </div>
        </div>
    </div>
</div>
</div>

<!-- Page content-->
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-8">
            <!-- 내부탭 -->
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="tab-content" data-bs-toggle="tab" data-bs-target="#tab-content" type="button" role="tab" aria-selected="true">강의내용</button>
                    <button class="nav-link" id="tab-curri" data-bs-toggle="tab" data-bs-target="#tab-curri" type="button" role="tab" aria-selected="false">커리큘럼</button>
                    <button class="nav-link" id="tab-review" data-bs-toggle="tab" data-bs-target="#tab-review" type="button" role="tab" aria-selected="false">수강후기</button>
                </div>
            </nav>
            <!-- 강의 내용 -->
            <article id="lect_con">
                <section class="mb-5">
                    <p>품질상태에 대한 안내 이미지 첨부예정</p>
                    <h1 class="fw-bolder mb-1" style="margin-top: 2rem;">${book.title }</h1>
                    <div class="text-muted fst-italic mb-2">${book.content }</div>
                </section>
            </article>
<%--            <!-- 수강후기(review) 영역 -->--%>
<%--            <section class="mb-5" id="lect_review">--%>
<%--                <h2> 수강후기 </h2>--%>
<%--                <div class="card bg-light">--%>
<%--                    <div class="card-body">--%>
<%--                        <!-- 수강후기 리스트 -->--%>
<%--                        <div>--%>
<%--                            <c:forEach var="review" items="${reviewList }">--%>
<%--                                <div class="d-flex">--%>
<%--                                    <div class="review_mem">--%>
<%--                                        <p style="margin: 0 auto;">${review.memId}</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="riview_list">--%>
<%--                                        <div class="star-rating">--%>
<%--                                                &lt;%&ndash; 별점 출력 &ndash;%&gt;--%>
<%--                                            <c:forEach begin="1" end="${review.star}" var="i">--%>
<%--                                                <span class="star-icon filled"></span>--%>
<%--                                            </c:forEach>--%>
<%--                                            <c:forEach begin="${review.star + 1}" end="5" var="i">--%>
<%--                                                <span class="star-icon"></span>--%>
<%--                                            </c:forEach>--%>
<%--                                        </div>--%>
<%--                                        <div>${review.content } </div>--%>
<%--                                        <div id="reg">--%>
<%--                                            <fmt:parseDate value="${review.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />--%>
<%--                                            <fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </c:forEach>--%>

<%--                        </div>--%>
<%--                        <c:if test="${empty reviewList }">--%>
<%--                            <tr>--%>
<%--                                <td colspan="4">수강후기가 존재하지 않습니다.</td>--%>
<%--                            </tr>--%>
<%--                        </c:if>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </section>--%>
        </div>
        <!-- 우측 탭-->
<%--        <div class="col-lg-4" id="lect_tab">--%>
<%--            <div class="card mb-4">--%>
<%--                <div class="card-header">--%>
<%--                    <h2><fmt:formatNumber value="${book.cost }" pattern="#,###" />원</h2>--%>
<%--                    <a href="${path}/payment/payinsert.do?lno=${book.lno }" class="btn btn-primary" id="button-search" >바로 수강신청 하기</a>--%>
<%--                </div>--%>
<%--                <div class="card-body">--%>
<%--                    <div class="input-group">--%>
<%--                        <ul>--%>
<%--                            <li>난이도 : 입문</li>--%>
<%--                            <li>1개의 코딩 연습</li>--%>
<%--                            <li>수강기한 : 무제한</li>--%>
<%--                            <li>수료증 : 발급</li>--%>
<%--                        </ul>--%>
<%--                        <div>지식공유자 답변이 제공되는 강의입니다</div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>

<jsp:include page="../layout/footer.jsp" />

</body>
</html>
    