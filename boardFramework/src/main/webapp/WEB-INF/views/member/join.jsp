<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>

<script>
$(document).ready(function() {

	$("#joinBtn").click(function() {
		$.fn.serializeObject = function()
		{
		   var o = {};
		   var a = this.serializeArray();
		   $.each(a, function() {
		       if (o[this.name]) {
		           if (!o[this.name].push) {
		               o[this.name] = [o[this.name]];
		           }
		           o[this.name].push(this.value || '');
		       } else {
		           o[this.name] = this.value || '';
		       }
		   });
		   return o;
		};
		var parameter = JSON.stringify($("#joinForm").serializeObject());
		
		$.ajax({
			url : '${root}/member',
			type : 'POST',
			contentType : 'application/json;charset=UTF-8',
			dataType : 'json',
			data : parameter,
			success : function(data) {
				if(data.isSuccess == 'true') {
					location.href = "${root}/member/list";
					//$(location).attr('href', 'member/list');
				}
			}
		});
	});
	

	
});

</script>
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
                <form id="joinForm" class="form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">아이디</label>
                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">이름</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_name" name="m_name" placeholder="이름">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">이메일</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_email" name="m_email" placeholder="이메일">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">비밀번호</label>

                            <div class="col-lg-11">
                                <input type="password" class="form-control" id="m_pwd" name="m_pwd" placeholder="비밀번호">
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
                                <input type="text" class="form-control" id="m_birth" name="m_birth" placeholder="생년월일 (입력 예: 2000-12-01)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">성별</label>

                            <div class="col-lg-11">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="1" id="m_gender" name="m_gender" checked="">
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
                                <input type="text" class="form-control" id="m_tel" name="m_tel" placeholder="전화번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">우편번호</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_postcode" name="m_postcode" placeholder="우편번호">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">주소</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_address1" name="m_address1" placeholder="주소">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">상세주소</label>

                            <div class="col-lg-11">
                                <input type="text" class="form-control" id="m_address2" name="m_address2" placeholder="주소">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-11 col-lg-offset-1">
                                <input id="joinBtn" type="button" class="btn btn-primary" value="확인">
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