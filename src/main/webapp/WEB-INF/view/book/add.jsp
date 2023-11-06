<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>


<form action="${path }/book/add" name="frm1" method="post" enctype="multipart/form-data">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">
                    <h5>상품 등록</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label class="floating-label" for="title">도서명</label>
                                <input type="text" class="form-control" name="title" id="title" placeholder="도서의 제목을 입력하세요." aria-describedby="도서 제목 도움" required>
                            </div>
                        </div>
                    </div>
                    <div class="row forOffline">
                        <div class="col">
                            <div class="form-group">
                                <label class="floating-label d-block" for="publish">출판사</label>
                                <input type="text" class="form-control wid-150 d-inline-block" name="publish" id="publish" aria-describedby="출판사 입력" >
                            </div>
                        </div>
                    </div>
                    <div class="row forOffline">
                        <div class="col">
                            <div class="form-group">
                                <label class="floating-label d-block" for="author">저자</label>
                                <input type="text" class="form-control mr-1 wid-150 d-inline-block" name="author" id="author" aria-describedby="저자 입력">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label class="floating-label d-block">도서 상태</label>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="quality1" name="quality" class="custom-control-input" value="1" checked>
                                    <label class="custom-control-label" for="quality1">상</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="quality2" name="quality" class="custom-control-input" value="2">
                                    <label class="custom-control-label" for="quality2">중</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="quality3" name="quality" class="custom-control-input" value="3">
                                    <label class="custom-control-label" for="quality3">하</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label class="floating-label" for="content">내용</label>
                                <textarea name="content" id="content" class="form-control" rows="8" cols="100" maxlength="1400" required></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label class="floating-label d-block">도서 이미지 업로드(10MB 이하)</label>
                                <input type="file" class="form-control uploadThumbnail" name="img" id="img" multiple>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label class="floating-label d-block" for="cost">도서가격</label>
                                <input type="number" class="form-control wid-150 d-inline-block" name="cost" id="cost" aria-describedby="도서 가격 입력" min="0"><p class="ml-2 d-inline-block">원</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row justify-content-md-end">
        <div class="col-md-1">
            <button type="submit" class="btn btn-primary" style="width:100%;">등록</button>
        </div>
    </div>
</form>

</body>
</html>
    