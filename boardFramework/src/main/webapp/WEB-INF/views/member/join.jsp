<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<body>



<!-- Container ======================================================================================= -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-header">
                <h2 id="container">회원 가입하기</h2>
            </div>

            <div class="well">
                <p>회원가입을 위해 아래 내용들을 작성해 주세요.</p>
                <form class="form-horizontal" action="/member/join.bit" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">아이디</label>
                            <div class="col-lg-11">
                                <input type="text" class="form-control" name="m_id" placeholder="아이디">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">이름</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" name="m_name" placeholder="이름">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">이메일</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" name="m_email" placeholder="이메일">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">비밀번호</label>

                            <div class="col-lg-11">
                                <input type="password" class="form-control" name="m_pwd" placeholder="비밀번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">비밀번호 확인</label>

                            <div class="col-lg-11">
                                <input type="password" class="form-control" placeholder="비밀번호 확인">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">생년월일</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" name="m_birth" placeholder="생년월일 (입력 예: 2000-12-01)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">성별</label>

                            <div class="col-lg-11">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="1" name="m_gender" checked="">
                                        남자
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" name="m_gender" value="2">
                                        여자
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">전화번호</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" name="m_tel" placeholder="전화번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">우편번호</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" name="m_postcode" placeholder="우편번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">주소</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" name="m_address1" placeholder="주소">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">상세주소</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" name="m_address2" placeholder="주소">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-11 col-lg-offset-1">
                                <button type="submit" class="btn btn-primary">확인</button>
                                <a href="/" class="btn btn-large btn-default">취소</a>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

    </div>

</div>

</body>
</html>