<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<body>

<script>
$(document).ready(function() {
	$(".modifyBtn").click(function() {
		
	});
});


</script>
<!-- Container ======================================================================================= -->
<div class="container">
	<div class="row">
	
<!-- ★★★ Contents -->
        <div class="col-lg-12">
            <div class="page-header2">
                <h3>회원정보</h3>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="120">
                        <col width="*">
                        <col width="120">
                        <col width="*">
                    </colgroup>
                    <tbody id="memberTbody">
                    <tr>
                        <th class="text-center">ID</th>
                        <td class="text-left">${member.m_id }</td>
                        <th class="text-center">회원명</th>
                        <td class="text-left">${member.m_name }</td>
                    </tr>
                    <tr>
                        <th class="text-center">생년월일</th>
                        <td class="text-left">${member.m_birth }</td>
                        <th class="text-center">성별</th>
                        <td class="text-left">${member.m_gender }</td>
                    </tr>
                    <tr>
                        <th class="text-center">전화번호</th>
                        <td class="text-left">${member.m_tel }</td>
                        <th class="text-center">주소</th>
                        <td class="text-left">${member.m_address1} ${member.m_address2}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            
            <div di="btnDiv" class="pull-right">
            	<button class="btn btn-success modifyBtn">수정</button>
                <a href="#" class="btn btn-large btn-default">삭제</a>
                <a href="./list.html" class="btn btn-large btn-default">목록</a>
            </div>

        </div>
      </div>

</body>
</html>